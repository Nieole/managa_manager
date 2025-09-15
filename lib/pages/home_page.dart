import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:isar/isar.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
  bool _showFavoritesOnly = false; // 是否只显示收藏

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
    
    // 构建查询条件
    if (_showFavoritesOnly && filterText.isNotEmpty) {
      // 收藏 + 搜索
      return await isar.mangas
          .filter()
          .isFavoriteEqualTo(true)
          .and()
          .titleContains(filterText, caseSensitive: false)
          .sortByMangaId()
          .offset(_page * _pageSize)
          .limit(_pageSize)
          .findAll();
    } else if (_showFavoritesOnly) {
      // 仅收藏
      return await isar.mangas
          .filter()
          .isFavoriteEqualTo(true)
          .sortByMangaId()
          .offset(_page * _pageSize)
          .limit(_pageSize)
          .findAll();
    } else if (filterText.isNotEmpty) {
      // 仅搜索
      return await isar.mangas
          .filter()
          .titleContains(filterText, caseSensitive: false)
          .sortByMangaId()
          .offset(_page * _pageSize)
          .limit(_pageSize)
          .findAll();
    } else {
      // 全部
      return await isar.mangas
          .where()
          .sortByMangaId()
          .offset(_page * _pageSize)
          .limit(_pageSize)
          .findAll();
    }
  }

  Future<int> _getTotalCount(Isar isar) async {
    final filterText = _searchController.text.trim();
    
    // 构建查询条件
    if (_showFavoritesOnly && filterText.isNotEmpty) {
      // 收藏 + 搜索
      return await isar.mangas
          .filter()
          .isFavoriteEqualTo(true)
          .and()
          .titleContains(filterText, caseSensitive: false)
          .count();
    } else if (_showFavoritesOnly) {
      // 仅收藏
      return await isar.mangas
          .filter()
          .isFavoriteEqualTo(true)
          .count();
    } else if (filterText.isNotEmpty) {
      // 仅搜索
      return await isar.mangas
          .filter()
          .titleContains(filterText, caseSensitive: false)
          .count();
    } else {
      // 全部
      return await isar.mangas.count();
    }
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

  void _toggleFavoritesFilter() {
    setState(() {
      _showFavoritesOnly = !_showFavoritesOnly;
      _page = 0; // 重置到第一页
    });
  }

  Future<void> _refreshManga(Manga manga) async {
    try {
      EasyLoading.show(status: '刷新中...');
      await _mangaRepo.refreshMangaById(manga.mangaId);
      if (mounted) {
        setState(() {}); // 刷新UI
        EasyLoading.showSuccess('刷新成功');
      }
    } catch (e) {
      if (mounted) {
        EasyLoading.showError('刷新失败: $e');
      }
    }
  }

  Future<void> _toggleFavorite(Manga manga) async {
    try {
      await _mangaRepo.toggleFavorite(manga.mangaId);
      if (mounted) {
        setState(() {}); // 刷新UI
      }
    } catch (e) {
      if (mounted) {
        EasyLoading.showError('操作失败: $e');
      }
    }
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
            onPressed: _toggleFavoritesFilter,
            icon: Icon(_showFavoritesOnly ? Icons.favorite : Icons.favorite_border),
            tooltip: _showFavoritesOnly ? '显示全部' : '只显示收藏',
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
              onChanged: (_) => setState(() => _page = 0), // 实时搜索时重置页码
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
                      return FutureBuilder<int>(
                        future: _getTotalCount(isar),
                        builder: (context, countSnap) {
                          final totalCount = countSnap.data ?? 0;
                          final totalPages = (totalCount / _pageSize).ceil();
                          final currentPage = _page + 1;
                          
                          return Column(
                            children: [
                              // 统计信息显示
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  '共 $totalCount 条记录，第 $currentPage / $totalPages 页',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: items.length,
                                  itemBuilder: (context, index) {
                                    final m = items[index];
                                    final selected = _selectedIds.contains(m.id);
                                    return Card(
                                      margin: const EdgeInsets.symmetric(vertical: 4),
                                      child: ListTile(
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
                                            : ClipRRect(
                                                borderRadius: BorderRadius.circular(8),
                                                child: m.imageUrl.isNotEmpty
                                                    ? CachedNetworkImage(
                                                        imageUrl: m.imageUrl,
                                                        width: 60,
                                                        height: 80,
                                                        fit: BoxFit.cover,
                                                        placeholder: (context, url) => Container(
                                                          width: 60,
                                                          height: 80,
                                                          color: Colors.grey[300],
                                                          child: const Icon(Icons.image, color: Colors.grey),
                                                        ),
                                                        errorWidget: (context, url, error) => Container(
                                                          width: 60,
                                                          height: 80,
                                                          color: Colors.grey[300],
                                                          child: const Icon(Icons.broken_image, color: Colors.grey),
                                                        ),
                                                      )
                                                    : Container(
                                                        width: 60,
                                                        height: 80,
                                                        color: Colors.grey[300],
                                                        child: const Icon(Icons.image, color: Colors.grey),
                                                      ),
                                              ),
                                        title: Text(
                                          m.title.isEmpty ? m.mangaId : m.title,
                                          style: const TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            if (m.description != null && m.description!.isNotEmpty)
                                              Text(
                                                m.description!,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(color: Colors.grey[600]),
                                              ),
                                            const SizedBox(height: 4),
                                            Row(
                                              children: [
                                                if (m.year > 0) ...[
                                                  Icon(Icons.calendar_today, size: 14, color: Colors.grey[500]),
                                                  const SizedBox(width: 4),
                                                  Text('${m.year}', style: TextStyle(fontSize: 12, color: Colors.grey[500])),
                                                  const SizedBox(width: 12),
                                                ],
                                                if (m.views != null && m.views! > 0) ...[
                                                  Icon(Icons.visibility, size: 14, color: Colors.grey[500]),
                                                  const SizedBox(width: 4),
                                                  Text('${m.views}', style: TextStyle(fontSize: 12, color: Colors.grey[500])),
                                                ],
                                              ],
                                            ),
                                          ],
                                        ),
                                        trailing: _selectionMode
                                            ? null
                                            : Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  IconButton(
                                                    icon: Icon(
                                                      m.isFavorite ? Icons.favorite : Icons.favorite_border,
                                                      color: m.isFavorite ? Colors.red : Colors.grey,
                                                    ),
                                                    onPressed: () => _toggleFavorite(m),
                                                    tooltip: m.isFavorite ? '取消收藏' : '添加收藏',
                                                  ),
                                                  IconButton(
                                                    icon: const Icon(Icons.refresh),
                                                    onPressed: () => _refreshManga(m),
                                                    tooltip: '刷新数据',
                                                  ),
                                                  const Icon(Icons.chevron_right),
                                                ],
                                              ),
                                        onTap: () {
                                          if (!_selectionMode) {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(builder: (_) => MangaDetailPage(mangaId: m.id)),
                                            );
                                          }
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('第 $currentPage 页'),
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
                                        onPressed: currentPage < totalPages
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


