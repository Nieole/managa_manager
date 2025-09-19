import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:dio/dio.dart';
import 'package:isar/isar.dart';

import '../models/settings.dart';
import '../services/isar_service.dart';
import '../repositories/settings_repository.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late Future<Isar> _isarFuture;
  final SettingsRepository _settingsRepo = SettingsRepository();
  final Dio _dio = Dio();
  
  String _currentSavePath = '';
  String _email = '';
  String _password = '';
  String _token = '';
  String _expire = '';
  bool _isLoggedIn = false;
  int _maxThreads = 3;

  @override
  void initState() {
    super.initState();
    _isarFuture = IsarService.getInstance();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    try {
      final isar = await _isarFuture;
      final settings = await isar.settings.where().findFirst();
      
      if (settings != null) {
        setState(() {
          _currentSavePath = settings.savePath;
          _email = settings.email;
          _password = settings.password;
          _token = settings.token;
          _expire = settings.expire;
          _maxThreads = settings.maxThreads.clamp(1, 10);
          _isLoggedIn = settings.token.isNotEmpty && _isTokenValid();
        });
      }
    } catch (e) {
      print('加载设置失败: $e');
      // 如果是RangeError，说明是字段索引冲突，需要迁移数据
      if (e.toString().contains('RangeError')) {
        await _migrateSettings();
      } else {
        // 其他错误，使用默认值
        setState(() {
          _currentSavePath = '';
          _email = '';
          _password = '';
          _token = '';
          _expire = '';
          _isLoggedIn = false;
        });
      }
    }
  }

  Future<void> _migrateSettings() async {
    try {
      print('开始迁移设置数据...');
      final isar = await _isarFuture;
      
      // 清除旧数据并创建新的设置记录
      await isar.writeTxn(() async {
        await isar.settings.clear();
        // 创建新的空设置记录
        final newSettings = Settings();
        await isar.settings.put(newSettings);
      });
      
      // 重新加载设置
      await _loadSettings();
      print('设置数据迁移完成');
    } catch (e) {
      print('迁移设置数据失败: $e');
      // 迁移失败，使用默认值
      setState(() {
        _currentSavePath = '';
        _email = '';
        _password = '';
        _token = '';
        _expire = '';
        _isLoggedIn = false;
      });
    }
  }

  bool _isTokenValid() {
    if (_expire.isEmpty || _token.isEmpty) return false;
    try {
      final expireDate = DateTime.parse(_expire);
      return DateTime.now().isBefore(expireDate);
    } catch (e) {
      print('Token验证失败: $e');
      return false;
    }
  }

  Future<void> _selectSavePath() async {
    try {
      String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
      if (selectedDirectory != null) {
        setState(() {
          _currentSavePath = selectedDirectory;
        });
        await _saveSettings();
        EasyLoading.showSuccess('保存路径已更新');
      }
    } catch (e) {
      EasyLoading.showError('选择路径失败: $e');
    }
  }

  Future<void> _login() async {
    if (_email.isEmpty || _password.isEmpty) {
      EasyLoading.showError('请输入邮箱和密码');
      return;
    }

    try {
      EasyLoading.show(status: '登录中...');
      
      final response = await _dio.post(
        'https://komiic.com/api/login',
        data: {
          'email': _email,
          'password': _password,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data;
        if (data['code'] == 200) {
          setState(() {
            _token = data['token'] ?? '';
            _expire = data['expire'] ?? '';
            _isLoggedIn = true;
          });
          
          await _saveSettings();
          EasyLoading.showSuccess('登录成功');
        } else {
          EasyLoading.showError('登录失败: ${data['message'] ?? '未知错误'}');
        }
      } else {
        EasyLoading.showError('登录失败: HTTP ${response.statusCode}');
      }
    } catch (e) {
      EasyLoading.showError('登录失败: $e');
    }
  }

  Future<void> _logout() async {
    setState(() {
      _token = '';
      _expire = '';
      _isLoggedIn = false;
    });
    await _saveSettings();
    EasyLoading.showSuccess('已退出登录');
  }

  Future<void> _saveSettings() async {
    try {
      final isar = await _isarFuture;
      
      // 尝试获取现有设置，如果不存在则创建新的
      Settings settings = await isar.settings.where().findFirst() ?? Settings();
      
      // 更新设置值
      settings.savePath = _currentSavePath;
      settings.email = _email;
      settings.password = _password;
      settings.token = _token;
      settings.expire = _expire;
      settings.maxThreads = _maxThreads;

      await isar.writeTxn(() async {
        await isar.settings.put(settings);
      });
    } catch (e) {
      print('保存设置失败: $e');
      EasyLoading.showError('保存设置失败: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveSettings,
            tooltip: '保存设置',
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 保存路径设置
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '保存路径设置',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          _currentSavePath.isEmpty ? '未设置保存路径' : _currentSavePath,
                          style: TextStyle(
                            color: _currentSavePath.isEmpty ? Colors.grey : Colors.black87,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: _selectSavePath,
                        child: const Text('选择路径'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // 登录设置
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        '账户登录',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: _isLoggedIn ? Colors.green : Colors.red,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          _isLoggedIn ? '已登录' : '未登录',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  
                  if (_isLoggedIn) ...[
                    // 已登录状态显示
                    Row(
                      children: [
                        const Icon(Icons.email, size: 16, color: Colors.grey),
                        const SizedBox(width: 8),
                        Text(
                          _email,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.access_time, size: 16, color: Colors.grey),
                        const SizedBox(width: 8),
                        Text(
                          'Token过期时间: ${_expire.isNotEmpty ? _expire : '未知'}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _logout,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('退出登录'),
                      ),
                    ),
                  ] else ...[
                    // 未登录状态显示登录表单
                    TextField(
                      decoration: const InputDecoration(
                        labelText: '邮箱',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _email = value;
                        });
                      },
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      decoration: const InputDecoration(
                        labelText: '密码',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                      ),
                      obscureText: true,
                      onChanged: (value) {
                        setState(() {
                          _password = value;
                        });
                      },
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _login,
                        child: const Text('登录'),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // 性能设置
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '性能设置',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.speed, color: Colors.blue),
                      const SizedBox(width: 8),
                      const Text('最大线程数:'),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Slider(
                          value: _maxThreads.clamp(1, 10).toDouble(),
                          min: 1,
                          max: 10,
                          divisions: 9,
                          label: '$_maxThreads',
                          onChanged: (value) {
                            setState(() {
                              _maxThreads = value.round().clamp(1, 10);
                            });
                          },
                        ),
                      ),
                      Text(
                        '$_maxThreads',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '设置同时进行的下载和同步任务数量。更多线程可以提高速度，但会消耗更多资源。',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // 其他设置
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '其他设置',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ListTile(
                    leading: const Icon(Icons.info),
                    title: const Text('关于应用'),
                    subtitle: const Text('漫画管理器 v1.0.0'),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('关于应用'),
                          content: const Text('漫画管理器\n版本: 1.0.0\n\n一个用于同步和管理在线漫画的应用。'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('确定'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
