import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:isar/isar.dart';
import 'dart:io';
import 'package:managa_manager/models/chapter.dart';

import '../models/manga.dart';
import '../repositories/settings_repository.dart';
import '../repositories/manga_repository.dart';
import '../services/download_service.dart';
import '../services/isar_service.dart';
import '../services/path_service.dart';
import 'manga_detail_page.dart';
import 'download_tasks_page.dart';
import 'settings_page.dart';

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
  bool _showDownloadedOnly = false; // 是否只显示已完全下载的漫画
  final Map<String, bool> _refreshingManga = {}; // 记录正在刷新的漫画
  int? _currentSyncId;
  bool _isAutoDownloading = false; // 是否正在自动下载
  String? _currentDownloadMangaId; // 当前正在下载的漫画ID

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

  // 将状态英文转中文
  String _statusToZh(String status) {
    final s = status.toLowerCase();
    if (s.contains('complete') || s.contains('completed') || s == 'end') return '完结';
    if (s.contains('ongoing') || s.contains('serialize') || s.contains('serial')) return '连载中';
    if (s.contains('pause') || s.contains('hiatus')) return '暂停';
    return status; // 默认原文
  }

  // 构建封面组件：优先本地加载，本地不存在则触发下载后再加载
  Widget _buildCover(BuildContext context, Manga m) {
    final box = Container(
      width: 60,
      height: 80,
      color: Colors.grey[300],
      child: const Icon(Icons.image, color: Colors.grey),
    );

    Future<File?> getLocal() async {
      if (m.coverLocalPath.isNotEmpty) {
        final f = File(m.coverLocalPath);
        if (await f.exists()) return f;
      }
      // 本地没有则尝试下载
      await _mangaRepo.refreshMangaById(m.mangaId); // 获取最新imageUrl并保存
      await _mangaRepo
          .refreshMangaById(m.mangaId); // 再次确保封面已下载（内部有ensureCoverDownloaded）
      if (m.coverLocalPath.isNotEmpty) {
        final f2 = File(m.coverLocalPath);
        if (await f2.exists()) return f2;
      }
      return null;
    }

    return FutureBuilder<File?>(
      future: getLocal(),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return box;
        }
        final file = snap.data;
        if (file != null) {
          return FittedBox(
            fit: BoxFit.contain,
            child: Image.file(file),
          );
        }
        return box;
      },
    );
  }

  void _openCoverPreview(BuildContext context, Manga m) async {
    File? file;
    if (m.coverLocalPath.isNotEmpty && await File(m.coverLocalPath).exists()) {
      file = File(m.coverLocalPath);
    } else {
      // 尝试下载
      await _mangaRepo.refreshMangaById(m.mangaId);
      if (m.coverLocalPath.isNotEmpty && await File(m.coverLocalPath).exists()) {
        file = File(m.coverLocalPath);
      }
    }
    if (!mounted) return;
    showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          insetPadding: const EdgeInsets.all(16),
          child: file != null
              ? InteractiveViewer(
                  minScale: 0.5,
                  maxScale: 5,
                  child: Image.file(file),
                )
              : SizedBox(
                  width: 300,
                  height: 400,
                  child: Center(
                    child: Text('未找到封面', style: Theme.of(context).textTheme.bodyLarge),
                  ),
                ),
        );
      },
    );
  }

  Future<List<Manga>> _queryPage(Isar isar) async {
    final filterText = _searchController.text.trim();
    List<Manga> allMangas = [];

    // 先获取所有符合条件的漫画
    if (_showFavoritesOnly && filterText.isNotEmpty) {
      // 收藏 + 搜索
      allMangas = await isar.mangas
          .filter()
          .isFavoriteEqualTo(true)
          .and()
          .titleContains(filterText, caseSensitive: false)
          .findAll();
    } else if (_showFavoritesOnly) {
      // 仅收藏
      allMangas = await isar.mangas
          .filter()
          .isFavoriteEqualTo(true)
          .findAll();
    } else if (filterText.isNotEmpty) {
      // 仅搜索
      allMangas = await isar.mangas
          .filter()
          .titleContains(filterText, caseSensitive: false)
          .findAll();
    } else {
      // 全部
      allMangas = await isar.mangas.where().findAll();
    }

    // 如果需要筛选已下载的漫画
    if (_showDownloadedOnly) {
      final downloadedMangas = <Manga>[];
      for (final manga in allMangas) {
        await manga.chapters.load();
        final totalChapters = manga.chapters.length;
        final downloadedChapters = manga.chapters.where((c) => c.isDownloaded).length;
        if (totalChapters > 0 && downloadedChapters == totalChapters) {
          downloadedMangas.add(manga);
        }
      }
      allMangas = downloadedMangas;
    }

    // 排序并分页
    allMangas.sort((a, b) => a.mangaId.compareTo(b.mangaId));
    final startIndex = _page * _pageSize;
    final endIndex = (startIndex + _pageSize).clamp(0, allMangas.length);
    return allMangas.sublist(startIndex, endIndex);
  }

  Future<int> _getTotalCount(Isar isar) async {
    final filterText = _searchController.text.trim();
    List<Manga> allMangas = [];

    // 先获取所有符合条件的漫画
    if (_showFavoritesOnly && filterText.isNotEmpty) {
      // 收藏 + 搜索
      allMangas = await isar.mangas
          .filter()
          .isFavoriteEqualTo(true)
          .and()
          .titleContains(filterText, caseSensitive: false)
          .findAll();
    } else if (_showFavoritesOnly) {
      // 仅收藏
      allMangas = await isar.mangas
          .filter()
          .isFavoriteEqualTo(true)
          .findAll();
    } else if (filterText.isNotEmpty) {
      // 仅搜索
      allMangas = await isar.mangas
          .filter()
          .titleContains(filterText, caseSensitive: false)
          .findAll();
    } else {
      // 全部
      allMangas = await isar.mangas.where().findAll();
    }

    // 如果需要筛选已下载的漫画
    if (_showDownloadedOnly) {
      final downloadedMangas = <Manga>[];
      for (final manga in allMangas) {
        await manga.chapters.load();
        final totalChapters = manga.chapters.length;
        final downloadedChapters = manga.chapters.where((c) => c.isDownloaded).length;
        if (totalChapters > 0 && downloadedChapters == totalChapters) {
          downloadedMangas.add(manga);
        }
      }
      return downloadedMangas.length;
    }

    return allMangas.length;
  }

  Future<(int, int)> _getChapterStats(Isar isar, Manga manga) async {
    await manga.chapters.load();
    final totalChapters = manga.chapters.length;
    final downloadedChapters = manga.chapters.where((c) => c.isDownloaded).length;
    return (totalChapters, downloadedChapters);
  }


  Future<void> _onAnalyze() async {
    // 如果正在同步，则取消同步
    if (_isAnalyzing) {
      _isAnalyzing = false;
      if (mounted) {
        setState(() {}); // 刷新UI
        EasyLoading.showInfo('已取消同步');
      }
      return;
    }

    // 开始同步
    setState(() {
      _isAnalyzing = true;
    });

    try {
      await _mangaRepo.syncAllMangaParallel(
        onMangaAdded: (manga) {
          if (!_isAnalyzing) return;
          if (mounted) setState(() {});
        },
        onProgress: (id) {
          if (!_isAnalyzing) return;
          setState(() {
            _currentSyncId = id;
          });
        },
        shouldCancel: () => !_isAnalyzing,
      );

      // 检查是否被取消
      if (!_isAnalyzing) {
        return; // 已被取消，不显示成功消息
      }

      if (mounted) {
        _isAnalyzing = false;
        setState(() {
          _currentSyncId = null;
        });
      }
    } catch (e) {
      if (mounted) {
        _isAnalyzing = false;
        setState(() {
          _currentSyncId = null;
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

  void _toggleDownloadedFilter() {
    setState(() {
      _showDownloadedOnly = !_showDownloadedOnly;
      _page = 0; // 重置到第一页
    });
  }

  Future<void> _startAutoDownload() async {
    if (_isAutoDownloading) {
      _isAutoDownloading = false;
      if (mounted) {
        setState(() {
          _currentDownloadMangaId = null;
        });
        EasyLoading.showInfo('已取消自动下载');
      }
      return;
    }

    final savePath = await _settingsRepo.getSavePath();
    if (savePath == null || savePath.isEmpty) {
      EasyLoading.showInfo('请先设置保存路径');
      return;
    }

    setState(() {
      _isAutoDownloading = true;
      _currentDownloadMangaId = null;
    });

    try {
      final isar = await _isarFuture;
      final allMangas = await isar.mangas.where().sortByMangaId().findAll();
      
      for (final manga in allMangas) {
        if (!_isAutoDownloading) break; // 检查是否被取消
        
        setState(() {
          _currentDownloadMangaId = manga.mangaId;
        });

        await manga.chapters.load();
        final totalChapters = manga.chapters.length;
        final downloadedChapters = manga.chapters.where((c) => c.isDownloaded).length;
        
        // 如果有未下载的章节，则下载
        if (totalChapters > 0 && downloadedChapters < totalChapters) {
          for (final chapter in manga.chapters) {
            if (!_isAutoDownloading) break; // 检查是否被取消
            
            if (!chapter.isDownloaded) {
              try {
                await _downloadService.downloadChapter(chapter, savePath);
                
                // 验证下载是否成功
                if (chapter.downloadedPages >= chapter.totalPages && chapter.totalPages > 0) {
                  chapter.isDownloaded = true;
                }
                
                await isar.writeTxn(() async {
                  await isar.chapters.put(chapter);
                });
                
                if (mounted) setState(() {}); // 刷新UI
              } catch (e) {
                print('下载章节 ${chapter.chapterId} 失败: $e');
              }
            }
          }
        }
      }
      
      if (_isAutoDownloading && mounted) {
        _isAutoDownloading = false;
        setState(() {
          _currentDownloadMangaId = null;
        });
        EasyLoading.showSuccess('自动下载完成');
      }
    } catch (e) {
      if (mounted) {
        _isAutoDownloading = false;
        setState(() {
          _currentDownloadMangaId = null;
        });
        EasyLoading.showError('自动下载失败: $e');
      }
    }
  }

  Future<void> _refreshManga(Manga manga) async {
    final mangaId = manga.mangaId;

    // 如果正在刷新，则取消刷新
    if (_refreshingManga[mangaId] == true) {
      _refreshingManga[mangaId] = false;
      if (mounted) {
        setState(() {}); // 刷新UI
        EasyLoading.showInfo('已取消刷新');
      }
      return;
    }

    // 开始刷新
    _refreshingManga[mangaId] = true;
    if (mounted) {
      setState(() {}); // 刷新UI显示刷新状态
    }

    try {
      EasyLoading.show(status: '刷新中... (点击刷新按钮可取消)');
      await _mangaRepo.refreshMangaById(
        mangaId,
        shouldCancel: () => _refreshingManga[mangaId] == false,
      );

      // 检查是否被取消
      if (_refreshingManga[mangaId] == false) {
        return; // 已被取消，不显示成功消息
      }

      if (mounted) {
        _refreshingManga[mangaId] = false;
        setState(() {}); // 刷新UI
        EasyLoading.showSuccess('刷新成功');
      }
    } catch (e) {
      if (mounted) {
        _refreshingManga[mangaId] = false;
        setState(() {}); // 刷新UI

        // 如果是取消操作，显示取消消息
        if (e.toString().contains('操作已取消')) {
          EasyLoading.showInfo('刷新已取消');
        } else {
          EasyLoading.showError('刷新失败: $e');
        }
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
            icon: const Icon(Icons.settings),
            tooltip: '设置',
          ),
          IconButton(
            onPressed: _onAnalyze,
            icon: _isAnalyzing
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.analytics),
            tooltip: _isAnalyzing ? '点击取消同步' : '分析并同步',
          ),
          IconButton(
            onPressed: _toggleFavoritesFilter,
            icon: Icon(_showFavoritesOnly ? Icons.favorite : Icons.favorite_border),
            tooltip: _showFavoritesOnly ? '显示全部' : '只显示收藏',
          ),
          IconButton(
            onPressed: _toggleDownloadedFilter,
            icon: Icon(_showDownloadedOnly ? Icons.download_done : Icons.download_done_outlined),
            tooltip: _showDownloadedOnly ? '显示全部' : '只显示已下载',
          ),
          IconButton(
            onPressed: _startAutoDownload,
            icon: _isAutoDownloading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.auto_awesome),
            tooltip: _isAutoDownloading ? '点击取消自动下载' : '自动下载未完成章节',
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const DownloadTasksPage()),
              );
            },
            icon: const Icon(Icons.download_for_offline),
            tooltip: '下载任务管理',
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
            if (_isAnalyzing)
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        _currentSyncId == null
                            ? '正在同步...'
                            : '正在同步漫画ID: $_currentSyncId',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    TextButton(
                      onPressed: _onAnalyze,
                      child: const Text('取消'),
                    ),
                  ],
                ),
              ),
            if (_isAutoDownloading)
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        _currentDownloadMangaId == null
                            ? '正在自动下载...'
                            : '正在下载漫画ID: $_currentDownloadMangaId',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    TextButton(
                      onPressed: _startAutoDownload,
                      child: const Text('取消'),
                    ),
                  ],
                ),
              ),
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
                                            : GestureDetector(
                                                onTap: () => _openCoverPreview(context, m),
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(8),
                                                  child: _buildCover(context, m),
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
                                            // 作者
                                            if (m.author.isNotEmpty)
                                              Row(
                                                children: [
                                                  Icon(Icons.person, size: 14, color: Colors.grey[500]),
                                                  const SizedBox(width: 4),
                                                  Expanded(
                                                    child: Text(
                                                      m.author,
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            // 连载状态(中文) + 更新时间
                                            Row(
                                              children: [
                                                Icon(Icons.info_outline, size: 14, color: Colors.grey[500]),
                                                const SizedBox(width: 4),
                                                Text(
                                                  _statusToZh(m.status),
                                                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                                                ),
                                                const SizedBox(width: 12),
                                                Icon(Icons.update, size: 14, color: Colors.grey[500]),
                                                const SizedBox(width: 4),
                                                Text(
                                                  m.updatedAt != null
                                                      ? '${m.updatedAt!.toLocal().year.toString().padLeft(4, '0')}-${m.updatedAt!.toLocal().month.toString().padLeft(2, '0')}-${m.updatedAt!.toLocal().day.toString().padLeft(2, '0')} ${m.updatedAt!.toLocal().hour.toString().padLeft(2, '0')}:${m.updatedAt!.toLocal().minute.toString().padLeft(2, '0')}'
                                                      : '—',
                                                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                                                ),
                                              ],
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
                                                  const SizedBox(width: 12),
                                                ],
                                                // 章节统计
                                                FutureBuilder<(int, int)>(
                                                  future: _getChapterStats(isar, m),
                                                  builder: (context, statsSnap) {
                                                    if (statsSnap.hasData) {
                                                      final (total, downloaded) = statsSnap.data!;
                                                      return Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          Icon(Icons.menu_book, size: 14, color: Colors.grey[500]),
                                                          const SizedBox(width: 4),
                                                          Text(
                                                            '$downloaded/$total',
                                                            style: TextStyle(
                                                              fontSize: 12, 
                                                              color: downloaded == total && total > 0 
                                                                  ? Colors.green[600] 
                                                                  : Colors.grey[500],
                                                              fontWeight: downloaded == total && total > 0 
                                                                  ? FontWeight.bold 
                                                                  : FontWeight.normal,
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    }
                                                    return const SizedBox.shrink();
                                                  },
                                                ),
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
                                                    icon: _refreshingManga[m.mangaId] == true
                                                        ? const SizedBox(
                                                            width: 20,
                                                            height: 20,
                                                            child: CircularProgressIndicator(strokeWidth: 2),
                                                          )
                                                        : const Icon(Icons.refresh),
                                                    onPressed: () => _refreshManga(m),
                                                    tooltip: _refreshingManga[m.mangaId] == true
                                                        ? '点击取消刷新'
                                                        : '刷新数据',
                                                  ),
                                                  const Icon(Icons.chevron_right),
                                                ],
                                              ),
                                        onTap: () async {
                                          if (!_selectionMode) {
                                            final result = await Navigator.of(context).push(
                                              MaterialPageRoute(builder: (_) => MangaDetailPage(mangaId: m.id)),
                                            );
                                            // 如果返回true，表示需要刷新数据
                                            if (result == true && mounted) {
                                              setState(() {});
                                            }
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


