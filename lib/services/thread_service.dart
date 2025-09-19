import 'dart:async';
import 'dart:isolate';
import '../repositories/settings_repository.dart';

class ThreadService {
  static final ThreadService _instance = ThreadService._internal();
  factory ThreadService() => _instance;
  ThreadService._internal();

  final SettingsRepository _settingsRepo = SettingsRepository();
  final Map<String, StreamController<void>> _cancellationControllers = {};
  final Map<String, List<Future<void>>> _runningTasks = {};

  /// 获取最大线程数
  Future<int> getMaxThreads() async {
    return await _settingsRepo.getMaxThreads();
  }

  /// 并行执行任务
  Future<List<T>> executeInParallel<T>(
    String taskId,
    List<Future<T> Function()> tasks, {
    Function(int completed, int total)? onProgress,
    bool shouldCancel()?,
  }) async {
    final maxThreads = await getMaxThreads();
    final results = <T>[];
    final completed = <int>[];
    
    // 创建取消控制器
    final cancelController = StreamController<void>();
    _cancellationControllers[taskId] = cancelController;
    _runningTasks[taskId] = [];

    try {
      // 分批处理任务
      for (int i = 0; i < tasks.length; i += maxThreads) {
        // 检查是否应该取消
        if (shouldCancel?.call() == true || cancelController.isClosed) {
          break;
        }

        // 获取当前批次的任务
        final batchEnd = (i + maxThreads).clamp(0, tasks.length);
        final batchTasks = tasks.sublist(i, batchEnd);
        
        // 并行执行当前批次
        final batchFutures = batchTasks.asMap().entries.map((entry) {
          final index = entry.key;
          final task = entry.value;
          
          final future = task().then((result) {
            completed.add(i + index);
            onProgress?.call(completed.length, tasks.length);
            return result;
          }).catchError((error) {
            // 捕获错误并返回null，而不是抛出异常
            completed.add(i + index);
            onProgress?.call(completed.length, tasks.length);
            return null;
          });
          
          _runningTasks[taskId]!.add(future);
          return future;
        }).toList();

        // 等待当前批次完成，使用catchError处理错误
        final batchResults = await Future.wait(batchFutures);
        results.addAll(batchResults);
      }
    } finally {
      // 清理资源
      _cancellationControllers.remove(taskId);
      _runningTasks.remove(taskId);
    }

    return results;
  }

  /// 并行执行无返回值的任务
  Future<void> executeInParallelVoid(
    String taskId,
    List<Future<void> Function()> tasks, {
    Function(int completed, int total)? onProgress,
    bool shouldCancel()?,
  }) async {
    await executeInParallel(
      taskId,
      tasks.map((task) => () async {
        await task();
        return null;
      }).toList(),
      onProgress: onProgress,
      shouldCancel: shouldCancel,
    );
  }

  /// 取消任务
  void cancelTask(String taskId) {
    _cancellationControllers[taskId]?.close();
    _cancellationControllers.remove(taskId);
  }

  /// 检查任务是否正在运行
  bool isTaskRunning(String taskId) {
    return _cancellationControllers.containsKey(taskId);
  }

  /// 获取任务进度
  int getTaskProgress(String taskId) {
    final tasks = _runningTasks[taskId];
    if (tasks == null) return 0;
    
    // 由于Future没有isCompleted属性，我们返回任务总数
    // 实际进度应该通过onProgress回调来跟踪
    return tasks.length;
  }
}
