import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path/path.dart' as p;

import '../models/chapter.dart';
import '../services/http_service.dart';

class DownloadService {
  DownloadService({Dio? dio}) : _dio = dio ?? Dio();

  final Dio _dio;
  final HttpService _httpService = HttpService();

  Future<void> ensureDir(String dir) async {
    final d = Directory(dir);
    if (!await d.exists()) {
      await d.create(recursive: true);
    }
  }

  Future<void> downloadChapter(Chapter chapter, String baseDir, {Function(double)? onProgress}) async {
    if(chapter.isDownloaded){
      return;
    }
    // 确保已加载所属漫画信息
    try {
      await chapter.manga.load();
    } catch (_) {}

    // 组装目录：baseDir/<mangaTitle__mangaId>/<chapterTitle__chapterId>
    final mangaId = chapter.manga.value?.mangaId ?? '';
    final mangaTitle = chapter.manga.value?.title ?? mangaId;
    final chapterTitle = chapter.title.isEmpty ? chapter.chapterId : chapter.title;
    final mangaDirName = _sanitizeName('${mangaTitle}__${mangaId}');
    final chapterDirName = _sanitizeName('${chapterTitle}__${chapter.chapterId}');
    final mangaDir = p.join(baseDir, mangaDirName);
    final chapterDir = p.join(mangaDir, chapterDirName);
    await ensureDir(mangaDir);
    await ensureDir(chapterDir);
    chapter.localPath = chapterDir;
    // 同步漫画的本地路径
    if (chapter.manga.value != null) {
      chapter.manga.value!.localPath = mangaDir;
    }
    // 这里仅保留接口，真实的图片 URL 获取依赖 GraphQL 具体字段
    // 需要添加referer
    final referer = 'https://komiic.com/comic/${chapter.manga.value?.mangaId}/chapter/${chapter.chapterId}/images/all';
    for (int i = chapter.downloadedPages; i < chapter.totalPages; i++) {
      final img = i < chapter.images.length ? chapter.images[i] : null;
      if (img == null || img.kid.isEmpty) break;
      final saveFile = p.join(chapterDir, '${img.orderNumber}.jpg');

      // 若文件已存在则跳过下载并推进进度
      final f = File(saveFile);
      if (await f.exists()) {
        chapter.downloadedPages += 1;
        // 报告进度
        if (onProgress != null) {
          onProgress(chapter.downloadedPages / chapter.totalPages);
        }
        continue;
      }
      try {
        final dio = await _httpService.getAuthenticatedDio();
        await dio.download(
          "https://komiic.com/api/image/${img.kid}",
          saveFile,
          options: Options(
            headers: {'referer': referer},
          ),
        );
        // 验证文件是否真的下载成功
        if (await f.exists() && await f.length() > 0) {
          chapter.downloadedPages += 1;
          // 报告进度
          if (onProgress != null) {
            onProgress(chapter.downloadedPages / chapter.totalPages);
          }
        }
      } catch (e) {
        print('下载图片失败: ${img.kid}, 错误: $e');
        // 下载失败时不增加计数
      }
    }
    // 最终验证：检查所有图片文件是否都存在且大小大于0
    await _verifyChapterDownload(chapter);
  }

  /// 验证章节下载完整性
  Future<void> _verifyChapterDownload(Chapter chapter) async {
    if (chapter.localPath.isEmpty || chapter.totalPages == 0) {
      chapter.isDownloaded = false;
      return;
    }

    int actualDownloadedCount = 0;
    for (int i = 0; i < chapter.totalPages; i++) {
      final img = i < chapter.images.length ? chapter.images[i] : null;
      if (img == null) continue;
      
      final filePath = p.join(chapter.localPath, '${img.orderNumber}.jpg');
      final file = File(filePath);
      
      if (await file.exists() && await file.length() > 0) {
        actualDownloadedCount++;
      }
    }
    
    chapter.downloadedPages = actualDownloadedCount;
    chapter.isDownloaded = actualDownloadedCount >= chapter.totalPages;
  }

  /// 通用文件下载
  Future<String> downloadFile({required String url, required String savePath}) async {
    await ensureDir(p.dirname(savePath));
    await _dio.download(url, savePath);
    return savePath;
  }

  // 过滤 Windows 特殊字符，去除控制字符，并裁剪长度
  String _sanitizeName(String name) {
    // 移除非法字符 <>:"/\|?* 以及控制字符
    final sanitized = name
        .replaceAll(RegExp(r'[<>:"/\\|?*]'), '_')
        .replaceAll(RegExp(r'[\x00-\x1F]'), '')
        .trim();
    // 避免结尾为空或仅由点/空格组成
    var result = sanitized.replaceAll(RegExp(r'[ .]+$'), '');
    if (result.isEmpty) result = 'untitled';
    // 限制长度，避免超长路径问题
    if (result.length > 120) {
      result = result.substring(0, 120);
    }
    return result;
  }
}


