import 'package:isar/isar.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../models/download_task.dart';
import '../models/chapter.dart';
import '../models/manga.dart';
import '../services/isar_service.dart';
import '../repositories/settings_repository.dart';
import '../services/download_service.dart';

class DownloadTaskService {
  final DownloadService _downloadService = DownloadService();
  final SettingsRepository _settingsRepository = SettingsRepository();

  /// 添加下载任务
  Future<void> addDownloadTask(Chapter chapter) async {
    final isar = await IsarService.getInstance();
    
    // 检查是否已存在相同的任务
    final existingTask = await isar.downloadTasks
        .filter()
        .chapterIdEqualTo(chapter.chapterId)
        .findFirst();
    
    if (existingTask != null) {
      // 如果任务已存在且不是失败状态，则不重复添加
      if (existingTask.status != 'failed') {
        return;
      }
      // 如果是失败状态，删除旧任务
      await isar.writeTxn(() async {
        await isar.downloadTasks.delete(existingTask.id);
      });
    }

    // 确保章节的漫画信息已加载
    await chapter.manga.load();
    if (chapter.manga.value == null) {
      throw Exception('章节 ${chapter.chapterId} 没有关联的漫画信息');
    }

    final task = DownloadTask()
      ..mangaId = chapter.manga.value!.mangaId
      ..mangaTitle = chapter.manga.value!.title
      ..chapterId = chapter.chapterId
      ..chapterTitle = chapter.title.isEmpty ? chapter.chapterId : chapter.title
      ..status = 'pending'
      ..progress = 0.0
      ..downloadedPages = chapter.downloadedPages
      ..totalPages = chapter.totalPages
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now();

    await isar.writeTxn(() async {
      await isar.downloadTasks.put(task);
    });
  }

  /// 批量添加下载任务
  Future<void> addDownloadTasks(List<Chapter> chapters) async {
    final isar = await IsarService.getInstance();
    final tasks = <DownloadTask>[];

    for (final chapter in chapters) {
      // 检查是否已存在相同的任务
      final existingTask = await isar.downloadTasks
          .filter()
          .chapterIdEqualTo(chapter.chapterId)
          .findFirst();
      
      if (existingTask != null && existingTask.status != 'failed') {
        continue; // 跳过已存在的非失败任务
      }

      // 确保章节的漫画信息已加载
      await chapter.manga.load();
      if (chapter.manga.value == null) {
        print('章节 ${chapter.chapterId} 没有关联的漫画信息，跳过');
        continue;
      }

      final task = DownloadTask()
        ..mangaId = chapter.manga.value!.mangaId
        ..mangaTitle = chapter.manga.value!.title
        ..chapterId = chapter.chapterId
        ..chapterTitle = chapter.title.isEmpty ? chapter.chapterId : chapter.title
        ..status = 'pending'
        ..progress = 0.0
        ..downloadedPages = chapter.downloadedPages
        ..totalPages = chapter.totalPages
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now();

      tasks.add(task);
    }

    if (tasks.isNotEmpty) {
      await isar.writeTxn(() async {
        await isar.downloadTasks.putAll(tasks);
      });
    }
  }

  /// 开始执行下载任务
  Future<void> executeDownloadTask(DownloadTask task, {Function(DownloadTask)? onProgress}) async {
    final isar = await IsarService.getInstance();
    final savePath = await _settingsRepository.getSavePath();
    
    if (savePath == null || savePath.isEmpty) {
      throw Exception('请先设置保存路径');
    }

    // 更新任务状态为下载中
    task.status = 'downloading';
    task.updatedAt = DateTime.now();
    await isar.writeTxn(() async {
      await isar.downloadTasks.put(task);
    });

    try {
      // 获取章节对象
      final chapter = await isar.chapters
          .filter()
          .chapterIdEqualTo(task.chapterId)
          .findFirst();
      
      if (chapter == null) {
        throw Exception('找不到章节 ${task.chapterId}');
      }

      // 执行下载
      await _downloadService.downloadChapter(
        chapter,
        savePath,
        onProgress: (progress) {
          task.progress = progress;
          task.downloadedPages = (progress * task.totalPages).round();
          task.updatedAt = DateTime.now();
          
          // 异步更新进度，不等待
          isar.writeTxn(() async {
            await isar.downloadTasks.put(task);
          });
          
          // 通知UI更新进度
          onProgress?.call(task);
        },
      );

      // 验证下载是否成功
      if (chapter.downloadedPages >= chapter.totalPages && chapter.totalPages > 0) {
        chapter.isDownloaded = true;
        task.status = 'completed';
        task.progress = 1.0;
        task.downloadedPages = task.totalPages;
        
        // 更新章节状态
        await isar.writeTxn(() async {
          await isar.chapters.put(chapter);
        });
        
        // 删除已完成的任务
        await isar.writeTxn(() async {
          await isar.downloadTasks.delete(task.id);
        });
      } else {
        task.status = 'failed';
        task.errorMessage = '下载验证失败';
        
        // 更新任务状态
        await isar.writeTxn(() async {
          await isar.downloadTasks.put(task);
        });
      }

    } catch (e) {
      // 下载失败
      task.status = 'failed';
      task.errorMessage = e.toString();
      task.updatedAt = DateTime.now();
      
      await isar.writeTxn(() async {
        await isar.downloadTasks.put(task);
      });
      
      throw e;
    }
  }

  /// 暂停下载任务
  Future<void> pauseDownloadTask(DownloadTask task) async {
    final isar = await IsarService.getInstance();
    
    if (task.status == 'downloading') {
      task.status = 'paused';
      task.updatedAt = DateTime.now();
      
      await isar.writeTxn(() async {
        await isar.downloadTasks.put(task);
      });
    }
  }

  /// 恢复下载任务
  Future<void> resumeDownloadTask(DownloadTask task) async {
    final isar = await IsarService.getInstance();
    
    if (task.status == 'paused') {
      task.status = 'pending';
      task.updatedAt = DateTime.now();
      
      await isar.writeTxn(() async {
        await isar.downloadTasks.put(task);
      });
    }
  }

  /// 删除下载任务
  Future<void> deleteDownloadTask(DownloadTask task) async {
    final isar = await IsarService.getInstance();
    
    await isar.writeTxn(() async {
      await isar.downloadTasks.delete(task.id);
    });
  }

  /// 删除已完成的任务
  Future<void> deleteCompletedTasks() async {
    final isar = await IsarService.getInstance();
    
    await isar.writeTxn(() async {
      await isar.downloadTasks
          .filter()
          .statusEqualTo('completed')
          .deleteAll();
    });
  }

  /// 获取所有下载任务，按漫画ID分组
  Future<Map<String, List<DownloadTask>>> getAllDownloadTasksGrouped() async {
    final isar = await IsarService.getInstance();
    final allTasks = await isar.downloadTasks
        .where()
        .sortByMangaId()
        .thenByCreatedAt()
        .findAll();
    
    final groupedTasks = <String, List<DownloadTask>>{};
    for (final task in allTasks) {
      if (!groupedTasks.containsKey(task.mangaId)) {
        groupedTasks[task.mangaId] = [];
      }
      groupedTasks[task.mangaId]!.add(task);
    }
    
    return groupedTasks;
  }

  /// 获取指定漫画的下载任务
  Future<List<DownloadTask>> getDownloadTasksByMangaId(String mangaId) async {
    final isar = await IsarService.getInstance();
    return await isar.downloadTasks
        .filter()
        .mangaIdEqualTo(mangaId)
        .sortByCreatedAt()
        .findAll();
  }

  /// 检查漫画是否还有未完成的任务
  Future<bool> hasIncompleteTasks(String mangaId) async {
    final isar = await IsarService.getInstance();
    final allTasks = await isar.downloadTasks
        .filter()
        .mangaIdEqualTo(mangaId)
        .findAll();
    
    final incompleteTasks = allTasks.where((task) => task.status != 'completed').length;
    return incompleteTasks > 0;
  }
}
