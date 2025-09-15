import 'package:isar/isar.dart';
import 'chapter.dart';

part 'manga.g.dart';

@collection
class Manga {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String mangaId = ""; // 漫画在线ID (对应GraphQL的id)

  String title = ""; // 漫画标题

  String status = ""; // 状态 (对应GraphQL的status)

  int year = 0; // 年份 (对应GraphQL的year)

  String imageUrl = ""; // 封面图片URL (对应GraphQL的imageUrl)

  bool? adult; // 是否成人内容 (对应GraphQL的adult)

  String? dateCreated; // 创建日期字符串 (对应GraphQL的dateCreated)

  String? dateUpdated; // 更新日期字符串 (对应GraphQL的dateUpdated)

  int? views; // 总浏览量 (对应GraphQL的views)

  int? monthViews; // 月浏览量 (对应GraphQL的monthViews)

  int favoriteCount = 0; // 收藏数 (对应GraphQL的favoriteCount)

  String? lastBookUpdate; // 最后书籍更新 (对应GraphQL的lastBookUpdate)

  String? lastChapterUpdate; // 最后章节更新 (对应GraphQL的lastChapterUpdate)

  String? description; // 漫画描述

  List<String> reasons = []; // 原因列表 (对应GraphQL的reasons)

  int? sexyLevel; // 性感等级 (对应GraphQL的sexyLevel)

  String? sexyLevelReason; // 性感等级原因 (对应GraphQL的sexyLevelReason)

  bool? sexualContent; // 是否包含性内容 (对应GraphQL的sexualContent)

  bool? ntr; // 是否NTR (对应GraphQL的ntr)

  List<String> warnings = []; // 警告列表 (对应GraphQL的warnings)

  List<String> otherTitles = []; // 其他标题 (对应GraphQL的otherTitles)

  String author = ""; // 作者 (从authors字段合并而来)

  List<String> categories = []; // 分类列表 (从categories字段合并而来)

  @Backlink(to: 'manga')
  final chapters = IsarLinks<Chapter>(); // 章节列表

  // 本地存储路径
  String localPath = "";

  // 是否已下载
  bool isDownloaded = false;

  // 是否已收藏
  bool isFavorite = false;

  // 便利方法：是否已完结
  bool get isCompleted => status.toLowerCase().contains('complete');

  // 便利方法：创建时间
  DateTime? get createdAt => dateCreated != null ? DateTime.tryParse(dateCreated!) : null;

  // 便利方法：更新时间
  DateTime? get updatedAt => dateUpdated != null ? DateTime.tryParse(dateUpdated!) : null;
}