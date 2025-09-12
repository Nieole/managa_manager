import 'package:isar/isar.dart';

import '../models/settings.dart';
import '../services/isar_service.dart';

class SettingsRepository {
  static const String keySavePath = 'save_path';

  Future<String?> getSavePath() async {
    final isar = await IsarService.getInstance();
    final setting = await isar.settings.filter().keyEqualTo(keySavePath).findFirst();
    return setting?.value.isEmpty == true ? null : setting?.value;
  }

  Future<void> setSavePath(String path) async {
    final isar = await IsarService.getInstance();
    final setting = Settings()
      ..key = keySavePath
      ..value = path;
    await isar.writeTxn(() async {
      await isar.settings.put(setting);
    });
  }
}


