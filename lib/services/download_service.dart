import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path/path.dart' as p;

import '../models/chapter.dart';

class DownloadService {
  DownloadService({Dio? dio}) : _dio = dio ?? Dio();

  final Dio _dio;

  Future<void> ensureDir(String dir) async {
    final d = Directory(dir);
    if (!await d.exists()) {
      await d.create(recursive: true);
    }
  }

  Future<void> downloadChapter(Chapter chapter, String baseDir) async {
    final chapterDir = p.join(baseDir, chapter.chapterId);
    await ensureDir(chapterDir);
    chapter.localPath = chapterDir;
    // 这里仅保留接口，真实的图片 URL 获取依赖 GraphQL 具体字段
    for (int i = chapter.downloadedPages; i < chapter.totalPages; i++) {
      final url = i < chapter.pageUrls.length ? chapter.pageUrls[i] : null;
      if (url == null || url.isEmpty) break;
      final saveFile = p.join(chapterDir, '${i + 1}.jpg');
      await _dio.download(url, saveFile);
      chapter.downloadedPages = i + 1;
    }
    chapter.isDownloaded = chapter.totalPages > 0 && chapter.downloadedPages >= chapter.totalPages;
  }

  /// 通用文件下载
  Future<String> downloadFile({required String url, required String savePath}) async {
    await ensureDir(p.dirname(savePath));
    await _dio.download(url, savePath);
    return savePath;
  }
}


