import 'package:isar/isar.dart';

import '../models/settings.dart';
import '../services/isar_service.dart';

class SettingsRepository {
  Future<String?> getSavePath() async {
    try {
      final isar = await IsarService.getInstance();
      final settings = await isar.settings.where().findFirst();
      return settings?.savePath.isEmpty == true ? null : settings?.savePath;
    } catch (e) {
      print('获取保存路径失败: $e');
      return null;
    }
  }

  Future<void> setSavePath(String path) async {
    try {
      final isar = await IsarService.getInstance();
      final settings = await isar.settings.where().findFirst() ?? Settings();
      settings.savePath = path;
      await isar.writeTxn(() async {
        await isar.settings.put(settings);
      });
    } catch (e) {
      print('设置保存路径失败: $e');
      rethrow;
    }
  }

  Future<String?> getToken() async {
    try {
      final isar = await IsarService.getInstance();
      final settings = await isar.settings.where().findFirst();
      return settings?.token.isEmpty == true ? null : settings?.token;
    } catch (e) {
      print('获取Token失败: $e');
      return null;
    }
  }

  Future<bool> isTokenValid() async {
    try {
      final isar = await IsarService.getInstance();
      final settings = await isar.settings.where().findFirst();
      if (settings?.token.isEmpty == true || settings?.expire.isEmpty == true) {
        return false;
      }
      try {
        final expireDate = DateTime.parse(settings!.expire);
        return DateTime.now().isBefore(expireDate);
      } catch (e) {
        return false;
      }
    } catch (e) {
      print('Token验证失败: $e');
      return false;
    }
  }

  Future<Settings?> getSettings() async {
    try {
      final isar = await IsarService.getInstance();
      return await isar.settings.where().findFirst();
    } catch (e) {
      print('获取设置失败: $e');
      return null;
    }
  }

  Future<void> saveSettings(Settings settings) async {
    try {
      final isar = await IsarService.getInstance();
      await isar.writeTxn(() async {
        await isar.settings.put(settings);
      });
    } catch (e) {
      print('保存设置失败: $e');
      rethrow;
    }
  }

  Future<int> getMaxThreads() async {
    try {
      final isar = await IsarService.getInstance();
      final settings = await isar.settings.where().findFirst();
      return settings?.maxThreads ?? 3; // 默认3个线程
    } catch (e) {
      print('获取线程数设置失败: $e');
      return 3;
    }
  }

  Future<void> setMaxThreads(int threads) async {
    try {
      final isar = await IsarService.getInstance();
      final settings = await isar.settings.where().findFirst() ?? Settings();
      settings.maxThreads = threads;
      await isar.writeTxn(() async {
        await isar.settings.put(settings);
      });
    } catch (e) {
      print('设置线程数失败: $e');
      rethrow;
    }
  }
}


