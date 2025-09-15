import 'package:isar/isar.dart';

import 'manga.dart';

part 'chapter.g.dart';

@collection
class Chapter {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String chapterId = ""; // 线上章节ID

  @Index()
  String title = ""; // 章节标题

  @Index()
  int orderIndex = 0; // 排序索引（从小到大）

  final manga = IsarLink<Manga>(); // 归属漫画

  // 页面图片信息（按顺序）
  List<ChapterImage> images = [];

  // 本地存储路径
  String localPath = "";

  // 已下载页数/总页数，用于增量与进度
  int downloadedPages = 0;
  int totalPages = 0;

  // 是否完成下载
  bool isDownloaded = false;
}

@embedded
class ChapterImage {
  String id = '';
  int width = 0;
  int height = 0;
  String kid = '';
  int orderNumber = 0;
}


