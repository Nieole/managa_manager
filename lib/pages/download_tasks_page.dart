import 'dart:io';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../models/chapter.dart';
import '../models/manga.dart';
import '../models/download_task.dart';
import '../services/isar_service.dart';
import '../repositories/settings_repository.dart';
import '../services/download_service.dart';
import '../services/download_task_service.dart';

class DownloadTasksPage extends StatefulWidget {
  const DownloadTasksPage({super.key});

  @override
  State<DownloadTasksPage> createState() => _DownloadTasksPageState();
}

class _DownloadTasksPageState extends State<DownloadTasksPage> {
  late Future<Isar> _isarFuture;
  final DownloadTaskService _downloadTaskService = DownloadTaskService();
  final Map<String, bool> _expandedManga = {};
  final ScrollController _scrollController = ScrollController();
  Map<String, List<DownloadTask>> _groupedTasks = {};
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _isarFuture = IsarService.getInstance();
    _loadDownloadTasks();
  }

  Future<void> _loadDownloadTasks() async {
    if (_isLoading) return;
    if (!mounted) return;
    
    setState(() {
      _isLoading = true;
    });
    
    try {
      _groupedTasks = await _downloadTaskService.getAllDownloadTasksGrouped();
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

  /// 执行下载任务
  Future<void> _executeDownloadTask(DownloadTask task) async {
    try {
      await _downloadTaskService.executeDownloadTask(
        task,
        onProgress: (updatedTask) {
          // 实时更新UI中的任务进度
          if (mounted) {
            setState(() {
              // 更新_groupedTasks中对应任务的进度
              final mangaId = updatedTask.mangaId;
              if (_groupedTasks.containsKey(mangaId)) {
                final tasks = _groupedTasks[mangaId]!;
                final index = tasks.indexWhere((t) => t.id == updatedTask.id);
                if (index != -1) {
                  tasks[index] = updatedTask;
                }
              }
            });
          }
        },
      );
      // 重新加载任务列表（已完成的任务会自动被删除）
      await _loadDownloadTasks();
    } catch (e) {
      EasyLoading.showError('下载失败: $e');
      // 即使失败也要刷新列表以更新状态
      await _loadDownloadTasks();
    }
  }

  /// 暂停下载任务
  Future<void> _pauseDownloadTask(DownloadTask task) async {
    await _downloadTaskService.pauseDownloadTask(task);
    await _loadDownloadTasks();
  }

  /// 恢复下载任务
  Future<void> _resumeDownloadTask(DownloadTask task) async {
    await _downloadTaskService.resumeDownloadTask(task);
    await _loadDownloadTasks();
  }

  /// 删除下载任务
  Future<void> _deleteDownloadTask(DownloadTask task) async {
    await _downloadTaskService.deleteDownloadTask(task);
    await _loadDownloadTasks();
  }

  /// 删除已完成的任务
  Future<void> _deleteCompletedTasks() async {
    await _downloadTaskService.deleteCompletedTasks();
    await _loadDownloadTasks();
    EasyLoading.showSuccess('已删除所有已完成的任务');
  }


  Widget _buildChapterItem(DownloadTask task) {
    final isDownloading = task.status == 'downloading';
    final isPaused = task.status == 'paused';
    final progress = task.progress;
    final isCompleted = task.status == 'completed';
    final isFailed = task.status == 'failed';

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
          task.chapterTitle,
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
                  ? '已完成 (${task.downloadedPages}/${task.totalPages})'
                  : isFailed
                      ? '下载失败 (${task.downloadedPages}/${task.totalPages})'
                      : isDownloading
                          ? (isPaused 
                              ? '已暂停 (${task.downloadedPages}/${task.totalPages})'
                              : '下载中... (${task.downloadedPages}/${task.totalPages})')
                          : '未开始 (0/${task.totalPages})',
              style: TextStyle(
                fontSize: 12,
                color: isCompleted ? Colors.grey : Colors.black87,
              ),
            ),
            if (isFailed && task.errorMessage != null)
              Text(
                '错误: ${task.errorMessage}',
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.red,
                ),
              ),
          ],
        ),
        trailing: isCompleted
            ? IconButton(
                icon: const Icon(Icons.delete, color: Colors.grey),
                onPressed: () => _deleteDownloadTask(task),
                tooltip: '删除任务',
              )
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
                          _resumeDownloadTask(task);
                        } else {
                          _pauseDownloadTask(task);
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
                      onPressed: () => _executeDownloadTask(task),
                      tooltip: isFailed ? '重试下载' : '开始下载',
                    ),
                  ],
                  // 删除按钮
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.grey),
                    onPressed: () => _deleteDownloadTask(task),
                    tooltip: '删除任务',
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildMangaSection(String mangaId, List<DownloadTask> tasks) {
    final isExpanded = _expandedManga[mangaId] ?? false;
    
    final completedTasks = tasks.where((task) => task.status == 'completed').toList();
    final failedTasks = tasks.where((task) => task.status == 'failed').toList();
    final pendingTasks = tasks.where((task) => task.status == 'pending').toList();
    final downloadingTasks = tasks.where((task) => task.status == 'downloading').toList();
    final pausedTasks = tasks.where((task) => task.status == 'paused').toList();

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: failedTasks.isNotEmpty 
                  ? Colors.red 
                  : (pendingTasks.isNotEmpty || downloadingTasks.isNotEmpty || pausedTasks.isNotEmpty)
                      ? Colors.orange 
                      : Colors.green,
              child: Text(
                '${completedTasks.length}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              tasks.isNotEmpty ? tasks.first.mangaTitle : mangaId,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              '已完成: ${completedTasks.length}/${tasks.length} | '
              '失败: ${failedTasks.length} | '
              '下载中: ${downloadingTasks.length} | '
              '暂停: ${pausedTasks.length} | '
              '待开始: ${pendingTasks.length}',
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (failedTasks.isNotEmpty)
                  IconButton(
                    icon: const Icon(Icons.refresh, color: Colors.red),
                    onPressed: () async {
                      for (final task in failedTasks) {
                        await _executeDownloadTask(task);
                      }
                    },
                    tooltip: '重试所有失败任务',
                  ),
                IconButton(
                  icon: Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                  ),
                  onPressed: () {
                    if (mounted) {
                      setState(() {
                        _expandedManga[mangaId] = !isExpanded;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
          if (isExpanded)
            Column(
              children: tasks.map((task) => _buildChapterItem(task)).toList(),
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
            icon: const Icon(Icons.delete_sweep),
            onPressed: _deleteCompletedTasks,
            tooltip: '删除已完成的任务',
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadDownloadTasks,
            tooltip: '刷新任务列表',
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _groupedTasks.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.download_done, size: 64, color: Colors.grey),
                      SizedBox(height: 16),
                      Text(
                        '暂无下载任务',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '请先在漫画详情页提交下载任务',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  controller: _scrollController,
                  itemCount: _groupedTasks.length,
                  itemBuilder: (context, index) {
                    final mangaId = _groupedTasks.keys.elementAt(index);
                    final tasks = _groupedTasks[mangaId]!;
                    return _buildMangaSection(mangaId, tasks);
                  },
                ),
    );
  }
}