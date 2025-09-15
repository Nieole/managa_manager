import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:isar/isar.dart';

import '../graphql/manga.graphql.dart';
import '../graphql/chapters.graphql.dart';
import '../models/chapter.dart';
import '../models/manga.dart';
import '../services/isar_service.dart';

class MangaRepository {
  MangaRepository({GraphQLClient? client, BuildContext? context}) 
      : _client = client ?? (context != null ? GraphQLProvider.of(context).value : throw ArgumentError('Either client or context must be provided'));

  final GraphQLClient _client;

  // 使用生成的 GraphQL 代码

  Future<void> syncAllManga({int startId = 1, Function(Manga)? onMangaAdded}) async {
    int comicId = startId;
    int consecutiveNotFoundCount = 0;
    const int maxConsecutiveNotFound = 10;
    
    while (true) {
      try {
        final manga = await fetchAndUpsertComicById(comicId.toString());
        if (manga == null) {
          // 如果返回 null，说明该 ID 不存在，继续下一个
          comicId++;
          continue;
        }
        // 成功获取到漫画，重置连续未找到计数并通知UI更新
        consecutiveNotFoundCount = 0;
        onMangaAdded?.call(manga);
        comicId++;
      } catch (e) {
        final errorMessage = e.toString();
        
        // 检查是否是"no rows in result set"错误
        if (errorMessage.contains('sql: no rows in result set') || 
            errorMessage.contains('Failed to retrieve comic by ID')) {
          consecutiveNotFoundCount++;
          print('ID $comicId 不存在 (连续未找到: $consecutiveNotFoundCount/$maxConsecutiveNotFound)');
          
          // 如果连续未找到达到上限，停止扫描
          if (consecutiveNotFoundCount >= maxConsecutiveNotFound) {
            print('连续 $maxConsecutiveNotFound 个ID不存在，停止扫描');
            break;
          }
          
          comicId++;
          continue;
        }
        
        // 其他错误，停止扫描
        print('扫描到 ID $comicId 时遇到错误: $e');
        break;
      }
    }
  }

  Future<Manga?> fetchAndUpsertComicById(String comicId) async {
    final isar = await IsarService.getInstance();
    
    final options = Options$Query$ComicById(
      variables: Variables$Query$ComicById(comicId: comicId),
    );
    
    final result = await _client.query$ComicById(options);
    
    if (result.hasException) {
      throw Exception('GraphQL error: ${result.exception}');
    }
    
    final data = result.parsedData;
    if (data == null) return null;
    final comic = data.comicById;
    if (comic == null) return null;

    final m = _mapComicToManga(comic)..mangaId = comic.id;

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
    
    final options = Options$Query$ChaptersByComicId(
      variables: Variables$Query$ChaptersByComicId(comicId: mangaId),
    );
    
    final result = await _client.query$ChaptersByComicId(options);
    
    if (result.hasException) {
      throw Exception('GraphQL error: ${result.exception}');
    }
    
    final data = result.parsedData;
    if (data == null) return;
    final chapters = data.chaptersByComicId;

    await isar.writeTxn(() async {
      final manga = await isar.mangas.filter().mangaIdEqualTo(mangaId).findFirst();
      if (manga == null) return;
      for (int i = 0; i < chapters.length; i++) {
        final c = chapters[i];
        if (c == null) continue; // 跳过 null 章节
        
        final chapterId = c.id;
        int totalPages = 0;
        try {
          final imgOptions = Options$Query$ImagesByChapterId(
            variables: Variables$Query$ImagesByChapterId(chapterId: chapterId),
          );
          final imgResult = await _client.query$ImagesByChapterId(imgOptions);
          if (!imgResult.hasException && imgResult.parsedData != null) {
            totalPages = imgResult.parsedData!.imagesByChapterId.length;
          }
        } catch (_) {}

        final chapter = Chapter()
          ..chapterId = chapterId
          ..title = c.serial
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
    final options = Options$Query$GetDownloadChapterUrl(
      variables: Variables$Query$GetDownloadChapterUrl(chapterId: chapterId),
    );
    
    final result = await _client.query$GetDownloadChapterUrl(options);
    
    if (result.hasException) {
      throw Exception('GraphQL error: ${result.exception}');
    }
    
    final data = result.parsedData;
    if (data == null) return null;
    final url = data.getDownloadChapterUrl?.url;
    return (url != null && url.isNotEmpty) ? url : null;
  }

  Manga _mapComicToManga(Query$ComicById$comicById comic) {
    final tags = <String>[];
    for (final c in comic.categories) {
      if (c?.name != null && c!.name.isNotEmpty) {
        tags.add(c.name);
      }
    }

    String authorJoined = '';
    if (comic.authors.isNotEmpty) {
      authorJoined = comic.authors
          .where((a) => a?.name != null && a!.name.isNotEmpty)
          .map((a) => a!.name)
          .join(', ');
    }

    return Manga()
      ..mangaId = comic.id
      ..title = comic.title
      ..cover = comic.imageUrl
      ..description = comic.description ?? ''
      ..author = authorJoined
      ..tags = tags
      ..isCompleted = comic.status.toLowerCase().contains('complete')
      ..createdAt = comic.dateCreated != null ? DateTime.tryParse(comic.dateCreated!) : null
      ..updatedAt = comic.dateUpdated != null ? DateTime.tryParse(comic.dateUpdated!) : null;
  }
}


