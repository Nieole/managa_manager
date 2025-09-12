import 'package:isar/isar.dart';
import 'chapter.dart';

part 'manga.g.dart';

@collection
class Manga {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String mangaId = ""; // 漫画在线ID

  String title = ""; // 漫画标题

  String cover = ""; // 封面图片URL

  String description = ""; // 漫画描述

  String author = ""; // 作者

  List<String> tags = []; // 标签列表

  DateTime? updatedAt; // 更新时间

  DateTime? createdAt; // 创建时间

  bool isCompleted = false; // 是否已完结

  @Backlink(to: 'manga')
  final chapters = IsarLinks<Chapter>(); // 章节列表

  // 本地存储路径
  String localPath = "";

  // 是否已下载
  bool isDownloaded = false;
}