import 'dart:convert';

import 'package:isar/isar.dart';

import '../models/chapter.dart';
import '../models/manga.dart';
import '../services/isar_service.dart';
import '../services/komiic_api.dart';

class MangaRepository {
  MangaRepository({KomiicApi? api}) : _api = api ?? KomiicApi();

  final KomiicApi _api;

  // 按实际 schema 的查询
  static const String queryRecentUpdate = r'''
query RecentUpdate($limit: Int!, $offset: Int!, $adult: Boolean) {
  recentUpdate(
    pagination: { limit: $limit, offset: $offset, orderBy: ID, asc: true }
    adult: $adult
  ) {
    id
    title
    status
    year
    imageUrl
    adult
    dateCreated
    dateUpdated
    views
    monthViews
    favoriteCount
    lastBookUpdate
    lastChapterUpdate
    description
    reasons
    sexyLevel
    sexyLevelReason
    sexualContent
    ntr
    warnings
    otherTitles
    authors { name }
    categories { name }
  }
}
''';

  static const String queryChaptersByComicId = r'''
query ChaptersByComicId($comicId: ID!) {
  chaptersByComicId(comicId: $comicId) {
    id
    serial
    type
    size
    dateCreated
    dateUpdated
  }
}
''';

  static const String queryImagesByChapterId = r'''
query ImagesByChapterId($chapterId: ID!) {
  imagesByChapterId(chapterId: $chapterId) {
    id
    kid
    orderNumber
    width
    height
    dateCreated
    dateUpdated
  }
}
''';

  static const String queryGetDownlaodChapterUrl = r'''
query GetDownlaodChapterUrl($chapterId: ID!) {
  getDownlaodChapterUrl(chapterId: $chapterId) {
    url
    status
  }
}
''';

  // 根据用户提供的单本漫画查询
  static const String queryComicById = r'''
query ComicById($comicId:ID!) {
  comicById(comicId: $comicId) {
    id
    title
    status
    year
    imageUrl
    adult
    dateCreated
    dateUpdated
    views
    monthViews
    favoriteCount
    lastBookUpdate
    lastChapterUpdate
    description
    reasons
    sexyLevel
    sexyLevelReason
    sexualContent
    ntr
    warnings
    otherTitles
    authors { name }
    categories { name }
  }
}
''';

  Future<void> syncAllManga({int pageSize = 100, bool adult = false}) async {
    final isar = await IsarService.getInstance();
    int offset = 0;
    while (true) {
      final resp = await _api.postGraphQL(
        query: queryRecentUpdate,
        variables: { 'limit': pageSize, 'offset': offset, 'adult': adult },
      );
      final data = resp.data is String ? json.decode(resp.data) : resp.data;
      final root = data['data'];
      if (root == null) break;
      final List nodes = (root['recentUpdate'] as List?) ?? [];
      if (nodes.isEmpty) break;

      final upserts = <Manga>[];
      for (final n in nodes) {
        upserts.add(_mapComicToManga(n));
      }

      await isar.writeTxn(() async {
        for (final m in upserts) {
          final exist = await isar.mangas.filter().mangaIdEqualTo(m.mangaId).findFirst();
          if (exist != null) {
            m.id = exist.id;
            m.localPath = exist.localPath;
            m.isDownloaded = exist.isDownloaded;
          }
          await isar.mangas.put(m);
        }
      });

      offset += nodes.length;
      if (nodes.length < pageSize) break;
    }
  }

  Future<Manga?> fetchAndUpsertComicById(String comicId) async {
    final isar = await IsarService.getInstance();
    final resp = await _api.postGraphQL(query: queryComicById, variables: {'comicId': comicId});
    final data = resp.data is String ? json.decode(resp.data) : resp.data;
    final root = data['data'];
    if (root == null) return null;
    final n = root['comicById'];
    if (n == null) return null;

    final tags = <String>[];
    final cats = (n['categories'] as List?) ?? const [];
    for (final c in cats) {
      final name = c?['name']?.toString();
      if (name != null && name.isNotEmpty) tags.add(name);
    }

    String authorJoined = '';
    final authors = (n['authors'] as List?) ?? const [];
    if (authors.isNotEmpty) {
      authorJoined = authors.map((a) => a?['name']?.toString() ?? '').where((e) => e.isNotEmpty).join(', ');
    }

    final m = Manga()
      ..mangaId = (n['id']?.toString() ?? comicId)
      ..title = (n['title']?.toString() ?? '')
      ..cover = (n['imageUrl']?.toString() ?? '')
      ..description = (n['description']?.toString() ?? '')
      ..author = authorJoined
      ..tags = tags
      ..isCompleted = (n['status']?.toString().toLowerCase().contains('complete') ?? false)
      ..createdAt = n['dateCreated'] != null ? DateTime.tryParse(n['dateCreated'].toString()) : null
      ..updatedAt = n['dateUpdated'] != null ? DateTime.tryParse(n['dateUpdated'].toString()) : null;

    await isar.writeTxn(() async {
      final exist = await isar.mangas.filter().mangaIdEqualTo(m.mangaId).findFirst();
      if (exist != null) {
        m.id = exist.id;
        m.localPath = exist.localPath;
        m.isDownloaded = exist.isDownloaded;
      }
      await isar.mangas.put(m);
    });
    return m;
  }

  Future<void> syncChaptersFor(String mangaId) async {
    final isar = await IsarService.getInstance();
    final resp = await _api.postGraphQL(query: queryChaptersByComicId, variables: {'comicId': mangaId});
    final data = resp.data is String ? json.decode(resp.data) : resp.data;
    final root = data['data'];
    if (root == null) return;
    final List chapters = (root['chaptersByComicId'] as List?) ?? [];

    await isar.writeTxn(() async {
      final manga = await isar.mangas.filter().mangaIdEqualTo(mangaId).findFirst();
      if (manga == null) return;
      for (int i = 0; i < chapters.length; i++) {
        final c = chapters[i];
        final chapterId = (c['id']?.toString() ?? '');
        int totalPages = 0;
        try {
          final imgResp = await _api.postGraphQL(query: queryImagesByChapterId, variables: {'chapterId': chapterId});
          final imgData = imgResp.data is String ? json.decode(imgResp.data) : imgResp.data;
          final List imgs = (imgData['data']?['imagesByChapterId'] as List?) ?? [];
          totalPages = imgs.length;
        } catch (_) {}

        final chapter = Chapter()
          ..chapterId = chapterId
          ..title = c['serial']?.toString() ?? ''
          ..orderIndex = i
          ..totalPages = totalPages;
        chapter.manga.value = manga;

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

  Future<String?> getDownloadUrlForChapter(String chapterId) async {
    final resp = await _api.postGraphQL(query: queryGetDownlaodChapterUrl, variables: {'chapterId': chapterId});
    final data = resp.data is String ? json.decode(resp.data) : resp.data;
    final url = data['data']?['getDownlaodChapterUrl']?['url']?.toString();
    return (url != null && url.isNotEmpty) ? url : null;
  }

  Manga _mapComicToManga(dynamic n) {
    final tags = <String>[];
    final cats = (n['categories'] as List?) ?? const [];
    for (final c in cats) {
      final name = c?['name']?.toString();
      if (name != null && name.isNotEmpty) tags.add(name);
    }

    String authorJoined = '';
    final authors = (n['authors'] as List?) ?? const [];
    if (authors.isNotEmpty) {
      authorJoined = authors.map((a) => a?['name']?.toString() ?? '').where((e) => e.isNotEmpty).join(', ');
    }

    return Manga()
      ..mangaId = (n['id']?.toString() ?? '')
      ..title = (n['title']?.toString() ?? '')
      ..cover = (n['imageUrl']?.toString() ?? '')
      ..description = (n['description']?.toString() ?? '')
      ..author = authorJoined
      ..tags = tags
      ..isCompleted = (n['status']?.toString().toLowerCase().contains('complete') ?? false)
      ..createdAt = n['dateCreated'] != null ? DateTime.tryParse(n['dateCreated'].toString()) : null
      ..updatedAt = n['dateUpdated'] != null ? DateTime.tryParse(n['dateUpdated'].toString()) : null;
  }
}


