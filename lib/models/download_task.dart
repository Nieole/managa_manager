import 'package:isar/isar.dart';

part 'download_task.g.dart';

@collection
class DownloadTask {
  Id id = Isar.autoIncrement;
  
  String mangaId = '';
  String mangaTitle = '';
  String chapterId = '';
  String chapterTitle = '';
  
  // 任务状态：pending, downloading, completed, failed, paused
  String status = 'pending';
  
  // 下载进度 (0.0 - 1.0)
  double progress = 0.0;
  
  // 已下载页数
  int downloadedPages = 0;
  
  // 总页数
  int totalPages = 0;
  
  // 创建时间
  DateTime createdAt = DateTime.now();
  
  // 更新时间
  DateTime updatedAt = DateTime.now();
  
  // 错误信息
  String? errorMessage;
  
  // 本地路径
  String localPath = '';
}
