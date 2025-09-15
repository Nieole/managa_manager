import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:isar/isar.dart';
import 'package:managa_manager/models/chapter.dart';

import '../models/manga.dart';
import '../repositories/settings_repository.dart';
import '../repositories/manga_repository.dart';
import '../services/download_service.dart';
import '../services/isar_service.dart';
import '../services/path_service.dart';
import 'manga_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  late Future<Isar> _isarFuture;
  final SettingsRepository _settingsRepo = SettingsRepository();
  late MangaRepository _mangaRepo;
  final DownloadService _downloadService = DownloadService();

  int _page = 0;
  static const int _pageSize = 20;
  bool _selectionMode = false;
  final Set<Id> _selectedIds = {};
  bool _isAnalyzing = false;

  @override
  void initState() {
    super.initState();
    _isarFuture = IsarService.getInstance();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _mangaRepo = MangaRepository(context: context);
  }

  Future<List<Manga>> _queryPage(Isar isar) async {
    final filterText = _searchController.text.trim();
    final qb = isar.mangas.where().sortByMangaId();
    if (filterText.isEmpty) {
      return qb.offset(_page * _pageSize).limit(_pageSize).findAll();
    }
    // 简单模糊匹配：先查全部 title 包含，再按 id 排
    return isar.mangas
        .filter()
        .titleContains(filterText, caseSensitive: false)
        .sortByMangaId()
        .offset(_page * _pageSize)
        .limit(_pageSize)
        .findAll();
  }

  Future<void> _onPickPath() async {
    final picked = await PathService.pickDirectory();
    if (picked == null) return;
    await _settingsRepo.setSavePath(picked);
    if (mounted) EasyLoading.showSuccess('已设置保存路径');
  }

  Future<void> _onAnalyze() async {
    if (_isAnalyzing) return;
    
    setState(() {
      _isAnalyzing = true;
    });
    
    try {
      await _mangaRepo.syncAllManga(
        onMangaAdded: (manga) {
          // 实时刷新UI，不阻塞页面
          if (mounted) {
            setState(() {});
          }
        },
      );
      if (mounted) {
        EasyLoading.showSuccess('同步完成');
      }
    } catch (e) {
      if (mounted) {
        EasyLoading.showError('同步失败: $e');
      }
    } finally {
      if (mounted) {
        setState(() {
          _isAnalyzing = false;
        });
      }
    }
  }

  void _toggleSelection() {
    setState(() {
      _selectionMode = !_selectionMode;
      if (!_selectionMode) _selectedIds.clear();
    });
  }

  Future<void> _downloadSelected() async {
    if (_selectedIds.isEmpty) return;
    final savePath = await _settingsRepo.getSavePath();
    if (savePath == null || savePath.isEmpty) {
      EasyLoading.showInfo('请先设置保存路径');
      return;
    }
    EasyLoading.show(status: '准备下载...');
    try {
      final isar = await _isarFuture;
      for (final localId in _selectedIds) {
        final manga = await isar.mangas.get(localId);
        if (manga == null) continue;
        // 确保章节已同步
        await _mangaRepo.syncChaptersFor(manga.mangaId);
        // 加载章节并下载
        await manga.chapters.load();
        for (final c in manga.chapters) {
          await _downloadService.downloadChapter(c, savePath);
          await isar.writeTxn(() async {
            await isar.chapters.put(c);
          });
        }
        // 如果所有章节完成，更新漫画标记
        final allDone = manga.chapters.every((c) => c.isDownloaded);
        if (allDone) {
          manga.isDownloaded = true;
          await isar.writeTxn(() async {
            await isar.mangas.put(manga);
          });
        }
      }
      EasyLoading.showSuccess('下载完成');
    } catch (e) {
      EasyLoading.showError('下载失败: $e');
    } finally {
      EasyLoading.dismiss();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('漫画管理'),
        actions: [
          IconButton(
            onPressed: _onPickPath,
            icon: const Icon(Icons.folder_open),
            tooltip: '设置保存路径',
          ),
          IconButton(
            onPressed: _isAnalyzing ? null : _onAnalyze,
            icon: _isAnalyzing 
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.analytics),
            tooltip: _isAnalyzing ? '同步中...' : '分析并同步',
          ),
          IconButton(
            onPressed: _toggleSelection,
            icon: Icon(_selectionMode ? Icons.check_box : Icons.check_box_outlined),
            tooltip: '批量选择',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: '搜索标题（模糊）',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => setState(() => _page = 0),
                ),
              ),
              onSubmitted: (_) => setState(() => _page = 0),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: FutureBuilder<Isar>(
                future: _isarFuture,
                builder: (context, isarSnap) {
                  if (!isarSnap.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final isar = isarSnap.data!;
                  return FutureBuilder<List<Manga>>(
                    future: _queryPage(isar),
                    builder: (context, snap) {
                      if (!snap.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      final items = snap.data!;
                      if (items.isEmpty) {
                        return const Center(child: Text('暂无数据'));
                      }
                      return Column(
                        children: [
                          Expanded(
                            child: ListView.separated(
                              itemCount: items.length,
                              separatorBuilder: (_, __) => const Divider(height: 1),
                              itemBuilder: (context, index) {
                                final m = items[index];
                                final selected = _selectedIds.contains(m.id);
                                return ListTile(
                                  leading: _selectionMode
                                      ? Checkbox(
                                          value: selected,
                                          onChanged: (v) {
                                            setState(() {
                                              if (v == true) {
                                                _selectedIds.add(m.id);
                                              } else {
                                                _selectedIds.remove(m.id);
                                              }
                                            });
                                          },
                                        )
                                      : null,
                                  title: Text(m.title.isEmpty ? m.mangaId : m.title),
                                  subtitle: Text(m.description, maxLines: 2, overflow: TextOverflow.ellipsis),
                                  trailing: const Icon(Icons.chevron_right),
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (_) => MangaDetailPage(mangaId: m.id)),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('第 ${_page + 1} 页'),
                              Row(
                                children: [
                                  TextButton(
                                    onPressed: _page > 0
                                        ? () => setState(() => _page -= 1)
                                        : null,
                                    child: const Text('上一页'),
                                  ),
                                  const SizedBox(width: 8),
                                  TextButton(
                                    onPressed: items.length == _pageSize
                                        ? () => setState(() => _page += 1)
                                        : null,
                                    child: const Text('下一页'),
                                  ),
                                ],
                              )
                            ],
                          ),
                          if (_selectionMode)
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                onPressed: _downloadSelected,
                                icon: const Icon(Icons.download),
                                label: Text('下载选中（${_selectedIds.length}）'),
                              ),
                            ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


