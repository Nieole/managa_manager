import 'dart:io';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../models/chapter.dart';
import '../models/manga.dart';
import '../services/isar_service.dart';
import '../repositories/settings_repository.dart';
import '../services/download_service.dart';

class DownloadTasksPage extends StatefulWidget {
  const DownloadTasksPage({super.key});

  @override
  State<DownloadTasksPage> createState() => _DownloadTasksPageState();
}

class _DownloadTasksPageState extends State<DownloadTasksPage> {
  late Future<Isar> _isarFuture;
  final DownloadService _downloadService = DownloadService();
  final Map<String, bool> _downloadingChapters = {};
  final Map<String, bool> _pausedChapters = {};
  final Map<String, bool> _expandedManga = {};
  final Map<String, double> _downloadProgress = {};
  final ScrollController _scrollController = ScrollController();
  List<Manga> _mangaList = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _isarFuture = IsarService.getInstance();
    _loadMangaList();
  }

  Future<void> _loadMangaList() async {
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
    });
    
    try {
      _mangaList = await _getMangaWithIncompleteChapters();
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<List<Manga>> _getMangaWithIncompleteChapters() async {
    final isar = await _isarFuture;
    final allMangas = await isar.mangas.where().findAll();
    final mangaWithIncompleteChapters = <Manga>[];

    for (final manga in allMangas) {
      await manga.chapters.load();
      final hasIncompleteChapters = manga.chapters.any((chapter) => 
        !chapter.isDownloaded && chapter.totalPages > 0);
      
      if (hasIncompleteChapters) {
        mangaWithIncompleteChapters.add(manga);
      }
    }

    // 按mangaId正序排列
    mangaWithIncompleteChapters.sort((a, b) => a.mangaId.compareTo(b.mangaId));
    return mangaWithIncompleteChapters;
  }

  Future<void> _downloadChapter(Chapter chapter) async {
    final savePath = await SettingsRepository().getSavePath();
    if (savePath == null || savePath.isEmpty) {
      EasyLoading.showInfo('请先设置保存路径');
      return;
    }

    // 设置下载状态
    _downloadingChapters[chapter.chapterId] = true;
    _pausedChapters[chapter.chapterId] = false;
    _downloadProgress[chapter.chapterId] = 0.0;
    _updateChapterProgress(chapter.chapterId);

    try {
      // 重新下载章节
      chapter.downloadedPages = 0;
      chapter.isDownloaded = false;
      
      await _downloadService.downloadChapter(
        chapter, 
        savePath,
        onProgress: (progress) {
          // 检查是否被暂停
          if (_pausedChapters[chapter.chapterId] == true) {
            return;
          }
          _downloadProgress[chapter.chapterId] = progress;
          _updateChapterProgress(chapter.chapterId);
        },
      );
      
      // 检查是否被暂停
      if (_pausedChapters[chapter.chapterId] == true) {
        print('章节 ${chapter.chapterId} 下载被暂停');
        return;
      }
      
      // 验证下载是否成功
      if (chapter.downloadedPages >= chapter.totalPages && chapter.totalPages > 0) {
        chapter.isDownloaded = true;
      }
      
      final isar = await _isarFuture;
      await isar.writeTxn(() async {
        await isar.chapters.put(chapter);
      });
      
      // 下载完成后，如果章节已完成，从列表中移除
      if (chapter.isDownloaded) {
        _mangaList.removeWhere((manga) {
          manga.chapters.removeWhere((c) => c.chapterId == chapter.chapterId);
          return manga.chapters.isEmpty;
        });
      }
      
      _updateChapterProgress(chapter.chapterId);
    } catch (e) {
      print('下载章节 ${chapter.chapterId} 失败: $e');
    } finally {
      _downloadingChapters[chapter.chapterId] = false;
      _pausedChapters[chapter.chapterId] = false;
      _downloadProgress.remove(chapter.chapterId);
      _updateChapterProgress(chapter.chapterId);
    }
  }

  void _pauseChapter(Chapter chapter) {
    setState(() {
      _pausedChapters[chapter.chapterId] = true;
    });
    _updateChapterProgress(chapter.chapterId);
  }

  void _resumeChapter(Chapter chapter) {
    setState(() {
      _pausedChapters[chapter.chapterId] = false;
    });
    _updateChapterProgress(chapter.chapterId);
  }

  void _updateChapterProgress(String chapterId) {
    // 只更新特定章节的进度，不触发整个页面重绘
    if (mounted) {
      setState(() {
        // 这里只更新必要的状态
      });
    }
  }

  Future<void> _downloadAllFailedChapters(Manga manga) async {
    final savePath = await SettingsRepository().getSavePath();
    if (savePath == null || savePath.isEmpty) {
      EasyLoading.showInfo('请先设置保存路径');
      return;
    }

    await manga.chapters.load();
    final failedChapters = manga.chapters.where((chapter) => 
      !chapter.isDownloaded && chapter.totalPages > 0 && chapter.downloadedPages > 0).toList();

    for (final chapter in failedChapters) {
      if (_downloadingChapters[chapter.chapterId] == true) continue;
      await _downloadChapter(chapter);
    }
  }

  Widget _buildChapterItem(Chapter chapter) {
    final isDownloading = _downloadingChapters[chapter.chapterId] == true;
    final isPaused = _pausedChapters[chapter.chapterId] == true;
    final progress = _downloadProgress[chapter.chapterId] ?? 
        (chapter.totalPages > 0 ? chapter.downloadedPages / chapter.totalPages : 0.0);
    final isCompleted = chapter.isDownloaded;
    // 修复状态判断逻辑：只有在下载失败且不在下载中时才显示为失败状态
    final isFailed = !isCompleted && !isDownloading && chapter.totalPages > 0 && chapter.downloadedPages > 0;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isCompleted 
              ? Colors.green 
              : isFailed 
                  ? Colors.red 
                  : isDownloading 
                      ? (isPaused ? Colors.orange : Colors.blue)
                      : Colors.grey,
          child: isCompleted
              ? const Icon(Icons.check, color: Colors.white)
              : isFailed
                  ? const Icon(Icons.error, color: Colors.white)
                  : isDownloading
                      ? (isPaused 
                          ? const Icon(Icons.pause, color: Colors.white)
                          : const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            ))
                      : const Icon(Icons.download, color: Colors.white),
        ),
        title: Text(
          chapter.title.isEmpty ? chapter.chapterId : chapter.title,
          style: TextStyle(
            decoration: isCompleted ? TextDecoration.lineThrough : null,
            color: isCompleted ? Colors.grey : null,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isDownloading || isFailed)
              LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(
                  isFailed ? Colors.red : (isPaused ? Colors.orange : Colors.blue),
                ),
              ),
            const SizedBox(height: 4),
            Text(
              isCompleted 
                  ? '已完成 (${chapter.downloadedPages}/${chapter.totalPages})'
                  : isFailed
                      ? '下载失败 (${chapter.downloadedPages}/${chapter.totalPages})'
                      : isDownloading
                          ? (isPaused 
                              ? '已暂停 (${chapter.downloadedPages}/${chapter.totalPages})'
                              : '下载中... (${chapter.downloadedPages}/${chapter.totalPages})')
                          : '未开始 (0/${chapter.totalPages})',
              style: TextStyle(
                fontSize: 12,
                color: isCompleted ? Colors.grey : Colors.black87,
              ),
            ),
          ],
        ),
        trailing: isCompleted
            ? null
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isDownloading) ...[
                    // 下载中时显示暂停按钮
                    IconButton(
                      icon: Icon(
                        isPaused ? Icons.play_arrow : Icons.pause,
                        color: isPaused ? Colors.green : Colors.orange,
                      ),
                      onPressed: () {
                        if (isPaused) {
                          _resumeChapter(chapter);
                        } else {
                          _pauseChapter(chapter);
                        }
                      },
                      tooltip: isPaused ? '继续下载' : '暂停下载',
                    ),
                  ] else ...[
                    // 未下载时显示开始/重试按钮
                    IconButton(
                      icon: Icon(
                        isFailed ? Icons.refresh : Icons.play_arrow,
                        color: isFailed ? Colors.red : Colors.blue,
                      ),
                      onPressed: () => _downloadChapter(chapter),
                      tooltip: isFailed ? '重试下载' : '开始下载',
                    ),
                  ],
                ],
              ),
      ),
    );
  }

  Widget _buildMangaSection(Manga manga) {
    final isExpanded = _expandedManga[manga.mangaId] ?? false;
    
    // 直接使用已加载的章节数据，避免FutureBuilder导致的重绘
    final incompleteChapters = manga.chapters.where((chapter) => 
      !chapter.isDownloaded && chapter.totalPages > 0).toList();
    final completedChapters = manga.chapters.where((chapter) => 
      chapter.isDownloaded).toList();
    final failedChapters = manga.chapters.where((chapter) => 
      !chapter.isDownloaded && chapter.totalPages > 0 && chapter.downloadedPages > 0).toList();

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: failedChapters.isNotEmpty 
                  ? Colors.red 
                  : incompleteChapters.isNotEmpty 
                      ? Colors.orange 
                      : Colors.green,
              child: Text(
                '${completedChapters.length}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              manga.title.isEmpty ? manga.mangaId : manga.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              '已完成: ${completedChapters.length}/${manga.chapters.length} | '
              '失败: ${failedChapters.length} | '
              '待下载: ${incompleteChapters.length - failedChapters.length}',
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (failedChapters.isNotEmpty)
                  IconButton(
                    icon: const Icon(Icons.refresh, color: Colors.red),
                    onPressed: () => _downloadAllFailedChapters(manga),
                    tooltip: '重试所有失败章节',
                  ),
                IconButton(
                  icon: Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                  ),
                  onPressed: () {
                    setState(() {
                      _expandedManga[manga.mangaId] = !isExpanded;
                    });
                  },
                ),
              ],
            ),
          ),
          if (isExpanded)
            Column(
              children: incompleteChapters.map((chapter) => _buildChapterItem(chapter)).toList(),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('下载任务'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadMangaList,
            tooltip: '刷新任务列表',
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _mangaList.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_circle, size: 64, color: Colors.green),
                      SizedBox(height: 16),
                      Text(
                        '所有下载任务已完成！',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '没有待下载的章节',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  controller: _scrollController,
                  itemCount: _mangaList.length,
                  itemBuilder: (context, index) {
                    return _buildMangaSection(_mangaList[index]);
                  },
                ),
    );
  }
}