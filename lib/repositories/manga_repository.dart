import 'dart:convert';

import 'package:isar/isar.dart';

import '../models/chapter.dart';
import '../models/manga.dart';
import '../services/isar_service.dart';
import '../services/komiic_api.dart';

class MangaRepository {
  MangaRepository({KomiicApi? api}) : _api = api ?? KomiicApi();

  final KomiicApi _api;

  // 由于缺少真实 schema，这里提供占位符查询，后续替换
  static const String queryAllMangaPlaceholder = r'''
query FetchManga($cursor: String) {
  mangas(after: $cursor, first: 100) {
    pageInfo { hasNextPage endCursor }
    nodes { id title cover description author updatedAt createdAt tags completed }
  }
}
''';

  static const String queryChaptersPlaceholder = r'''
query FetchChapters($mangaId: ID!) {
  manga(id: $mangaId) {
    chapters { id title order pages }
  }
}
''';

  Future<void> syncAllManga() async {
    final isar = await IsarService.getInstance();
    String? cursor;
    bool hasNext = true;

    while (hasNext) {
      final resp = await _api.postGraphQL(query: queryAllMangaPlaceholder, variables: {
        'cursor': cursor,
      });
      final data = resp.data is String ? json.decode(resp.data) : resp.data;
      final root = data['data'];
      if (root == null) break;
      final conn = root['mangas'];
      final List nodes = (conn?['nodes'] as List?) ?? [];
      hasNext = (conn?['pageInfo']?['hasNextPage'] as bool?) ?? false;
      cursor = conn?['pageInfo']?['endCursor'] as String?;

      final upserts = <Manga>[];
      for (final n in nodes) {
        final m = Manga()
          ..mangaId = (n['id']?.toString() ?? '')
          ..title = (n['title']?.toString() ?? '')
          ..cover = (n['cover']?.toString() ?? '')
          ..description = (n['description']?.toString() ?? '')
          ..author = (n['author']?.toString() ?? '')
          ..tags = (n['tags'] as List?)?.map((e) => e.toString()).toList() ?? []
          ..isCompleted = (n['completed'] as bool?) ?? false
          ..createdAt = n['createdAt'] != null ? DateTime.tryParse(n['createdAt'].toString()) : null
          ..updatedAt = n['updatedAt'] != null ? DateTime.tryParse(n['updatedAt'].toString()) : null;
        upserts.add(m);
      }

      await isar.writeTxn(() async {
        for (final m in upserts) {
          // 以 mangaId 去重合并
          final exist = await isar.mangas.filter().mangaIdEqualTo(m.mangaId).findFirst();
          if (exist != null) {
            m.id = exist.id;
            m.localPath = exist.localPath;
            m.isDownloaded = exist.isDownloaded;
          }
          await isar.mangas.put(m);
        }
      });
    }
  }

  Future<void> syncChaptersFor(String mangaId) async {
    final isar = await IsarService.getInstance();
    final resp = await _api.postGraphQL(query: queryChaptersPlaceholder, variables: {'mangaId': mangaId});
    final data = resp.data is String ? json.decode(resp.data) : resp.data;
    final root = data['data'];
    if (root == null) return;
    final List chapters = (root['manga']?['chapters'] as List?) ?? [];

    await isar.writeTxn(() async {
      final manga = await isar.mangas.filter().mangaIdEqualTo(mangaId).findFirst();
      if (manga == null) return;
      for (int i = 0; i < chapters.length; i++) {
        final c = chapters[i];
        final chapter = Chapter()
          ..chapterId = (c['id']?.toString() ?? '')
          ..title = (c['title']?.toString() ?? '')
          ..orderIndex = i
          ..totalPages = (c['pages'] is List) ? (c['pages'] as List).length : (c['pages'] as int? ?? 0);
        chapter.manga.value = manga;

        // 尝试合并原有章节状态
        final exist = await isar.chapters.filter().chapterIdEqualTo(chapter.chapterId).findFirst();
        if (exist != null) {
          chapter.id = exist.id;
          chapter.localPath = exist.localPath;
          chapter.downloadedPages = exist.downloadedPages;
          chapter.isDownloaded = exist.isDownloaded;
          chapter.pageUrls = exist.pageUrls;
        }
        await isar.chapters.put(chapter);
        await chapter.manga.save();
      }
    });
  }
}


