import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:isar/isar.dart';

import '../models/chapter.dart';
import '../models/manga.dart';
import '../services/isar_service.dart';

class MangaRepository {
  MangaRepository({GraphQLClient? client, BuildContext? context}) 
      : _client = client ?? (context != null ? GraphQLProvider.of(context).value : throw ArgumentError('Either client or context must be provided'));

  final GraphQLClient _client;

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

  Future<void> syncAllManga({int startId = 1, Function(Manga)? onMangaAdded}) async {
    int comicId = startId;
    
    while (true) {
      try {
        final manga = await fetchAndUpsertComicById(comicId.toString());
        if (manga == null) {
          // 如果返回 null，说明该 ID 不存在，继续下一个
          comicId++;
          continue;
        }
        // 成功获取到漫画，通知UI更新
        onMangaAdded?.call(manga);
        comicId++;
      } catch (e) {
        // 遇到错误（如网络错误、API 错误等），停止扫描
        print('扫描到 ID $comicId 时遇到错误: $e');
        break;
      }
    }
  }

  Future<Manga?> fetchAndUpsertComicById(String comicId) async {
    final isar = await IsarService.getInstance();
    
    final options = QueryOptions(
      document: gql(queryComicById),
      variables: {'comicId': comicId},
    );
    
    final result = await _client.query(options);
    
    if (result.hasException) {
      throw Exception('GraphQL error: ${result.exception}');
    }
    
    final data = result.data;
    if (data == null) return null;
    final n = data['comicById'];
    if (n == null) return null;

    final m = _mapComicToManga(n)..mangaId = (n['id']?.toString() ?? comicId);

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
    
    final options = QueryOptions(
      document: gql(queryChaptersByComicId),
      variables: {'comicId': mangaId},
    );
    
    final result = await _client.query(options);
    
    if (result.hasException) {
      throw Exception('GraphQL error: ${result.exception}');
    }
    
    final data = result.data;
    if (data == null) return;
    final List chapters = (data['chaptersByComicId'] as List?) ?? [];

    await isar.writeTxn(() async {
      final manga = await isar.mangas.filter().mangaIdEqualTo(mangaId).findFirst();
      if (manga == null) return;
      for (int i = 0; i < chapters.length; i++) {
        final c = chapters[i];
        final chapterId = (c['id']?.toString() ?? '');
        int totalPages = 0;
        try {
          final imgOptions = QueryOptions(
            document: gql(queryImagesByChapterId),
            variables: {'chapterId': chapterId},
          );
          final imgResult = await _client.query(imgOptions);
          if (!imgResult.hasException && imgResult.data != null) {
            final List imgs = (imgResult.data!['imagesByChapterId'] as List?) ?? [];
            totalPages = imgs.length;
          }
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
    final options = QueryOptions(
      document: gql(queryGetDownlaodChapterUrl),
      variables: {'chapterId': chapterId},
    );
    
    final result = await _client.query(options);
    
    if (result.hasException) {
      throw Exception('GraphQL error: ${result.exception}');
    }
    
    final data = result.data;
    if (data == null) return null;
    final url = data['getDownlaodChapterUrl']?['url']?.toString();
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


