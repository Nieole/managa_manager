import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/settings.dart';
import '../models/manga.dart';
import '../models/chapter.dart';
import '../models/download_task.dart';

class IsarService {
  IsarService._();
  static Isar? _instance;

  static Future<Isar> getInstance() async {
    if (_instance != null && _instance!.isOpen) return _instance!;
    final dir = await getApplicationDocumentsDirectory();
    _instance = await Isar.open([
      SettingsSchema,
      MangaSchema,
      ChapterSchema,
      DownloadTaskSchema,
    ], directory: dir.path);
    return _instance!;
  }
}


