import 'dart:io';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../models/chapter.dart';
import '../models/manga.dart';
import '../services/isar_service.dart';
import '../repositories/manga_repository.dart';
import '../services/download_task_service.dart';

class MangaDetailPage extends StatefulWidget {
  const MangaDetailPage({super.key, required this.mangaId});
  final Id mangaId;

  @override
  State<MangaDetailPage> createState() => _MangaDetailPageState();
}

class _MangaDetailPageState extends State<MangaDetailPage> {
  late Future<Isar> _isarFuture;
  late MangaRepository _repo;
  final DownloadTaskService _downloadTaskService = DownloadTaskService();
  bool _selectionMode = false;
  final Set<Id> _selectedChapterIds = {};
  List<Chapter> _currentChapters = [];

  @override
  void initState() {
    super.initState();
    _isarFuture = IsarService.getInstance();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _repo = MangaRepository(context: context);
  }

  void _toggleSelection() {
    if (mounted) {
      setState(() {
        _selectionMode = !_selectionMode;
        if (!_selectionMode) _selectedChapterIds.clear();
      });
    }
  }

  void _selectAllChapters(List<Chapter> chapters) {
    if (mounted) {
      setState(() {
        _selectedChapterIds.clear();
        for (final chapter in chapters) {
          _selectedChapterIds.add(chapter.id);
        }
      });
    }
  }

  void _selectUndownloadedChapters(List<Chapter> chapters) {
    if (mounted) {
      setState(() {
        _selectedChapterIds.clear();
        for (final chapter in chapters) {
          if (!chapter.isDownloaded && chapter.totalPages > 0) {
            _selectedChapterIds.add(chapter.id);
          }
        }
      });
    }
  }

  Future<void> _downloadSelectedChapters() async {
    if (_selectedChapterIds.isEmpty) return;
    
    final isar = await _isarFuture;
    final selectedChapters = <Chapter>[];
    
    try {
      // 获取选中的章节
      for (final chapterId in _selectedChapterIds) {
        final chapter = await isar.chapters.get(chapterId);
        if (chapter != null) {
          selectedChapters.add(chapter);
        }
      }
      
      if (selectedChapters.isEmpty) {
        EasyLoading.showInfo('没有找到选中的章节');
        return;
      }
      
      // 添加下载任务
      await _downloadTaskService.addDownloadTasks(selectedChapters);
      
      // 询问用户是否立即开始下载
      final shouldStartNow = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('下载任务已提交'),
          content: Text('已提交 ${selectedChapters.length} 个下载任务。是否立即开始下载？'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('稍后下载'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('立即下载'),
            ),
          ],
        ),
      );
      
      // 退出选择模式
      _selectionMode = false;
      _selectedChapterIds.clear();
      if (mounted) setState(() {});
      
      if (shouldStartNow == true) {
        // 立即开始下载选中的任务（不显示全屏遮罩）
        try {
          for (final chapter in selectedChapters) {
            final tasks = await _downloadTaskService.getDownloadTasksByMangaId(chapter.manga.value?.mangaId ?? '');
            final task = tasks.firstWhere(
              (t) => t.chapterId == chapter.chapterId,
              orElse: () => throw Exception('找不到对应的下载任务'),
            );
            await _downloadTaskService.executeDownloadTask(task);
          }
          EasyLoading.showSuccess('下载完成');
        } catch (e) {
          EasyLoading.showError('下载失败: $e');
        }
      } else {
        EasyLoading.showSuccess('已提交 ${selectedChapters.length} 个下载任务');
      }
    } catch (e) {
      EasyLoading.showError('提交下载任务失败: $e');
    }
  }

  Future<(Manga?, List<Chapter>)> _load(Isar isar) async {
    final manga = await isar.mangas.get(widget.mangaId);
    if (manga == null) return (null, <Chapter>[]);
    await manga.chapters.load();
    final chapters = manga.chapters.toList()..sort((a, b) => a.orderIndex.compareTo(b.orderIndex));
    _currentChapters = chapters; // 保存当前章节列表
    return (manga, chapters);
  }

  String _statusToZh(String status) {
    final s = status.toLowerCase();
    if (s.contains('complete') || s.contains('completed') || s == 'end') return '完结';
    if (s.contains('ongoing') || s.contains('serialize') || s.contains('serial')) return '连载中';
    if (s.contains('pause') || s.contains('hiatus')) return '暂停';
    return status;
  }

  Widget _cover(Manga m) {
    final box = Container(
      width: 140,
      height: 200,
      color: Colors.grey[300],
      child: const Icon(Icons.image, color: Colors.grey),
    );
    if (m.coverLocalPath.isNotEmpty) {
      final f = File(m.coverLocalPath);
      if (f.existsSync()) {
        return Image.file(
          f,
          width: 140,
          height: 200,
          fit: BoxFit.cover,
        );
      }
    }
    if (m.imageUrl.isNotEmpty) {
      return Image.network(m.imageUrl, width: 140, height: 200, fit: BoxFit.cover);
    }
    return box;
  }

  Widget _buildMetaInfo(Manga manga) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 基本信息行
          Row(
            children: [
              Expanded(child: _buildInlineMetaItem('状态', _statusToZh(manga.status))),
              if (manga.year > 0) Expanded(child: _buildInlineMetaItem('年份', '${manga.year}')),
            ],
          ),
          // 作者和标签行
          if (manga.author.isNotEmpty || manga.categories.isNotEmpty) ...[
            const SizedBox(height: 6),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (manga.author.isNotEmpty) ...[
                  Expanded(
                    flex: 2,
                    child: _buildInlineMetaItem('作者', manga.author),
                  ),
                ],
                if (manga.categories.isNotEmpty) ...[
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 3,
                    child: Wrap(
                      spacing: 3,
                      runSpacing: 3,
                      children: manga.categories.map((category) => 
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.blue.withOpacity(0.3)),
                          ),
                          child: Text(
                            category,
                            style: const TextStyle(
                              fontSize: 9,
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ).toList(),
                    ),
                  ),
                ],
              ],
            ),
          ],
          // 统计信息行
          if (manga.views != null && manga.views! > 0 || manga.dateUpdated != null) ...[
            const SizedBox(height: 6),
            Row(
              children: [
                if (manga.views != null && manga.views! > 0) 
                  Expanded(child: _buildInlineMetaItem('点阅', '${manga.views}')),
                if (manga.dateUpdated != null) 
                  Expanded(child: _buildInlineMetaItem('更新', manga.updatedAt != null
                      ? '${manga.updatedAt!.toLocal().year}-${manga.updatedAt!.toLocal().month.toString().padLeft(2, '0')}-${manga.updatedAt!.toLocal().day.toString().padLeft(2, '0')}'
                      : '')),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildMetaRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 60,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCompactMetaItem(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildInlineMetaItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 1),
        Text(
          value,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(Manga manga, List<Chapter> chapters) {
    final totalChapters = chapters.length;
    final downloadedChapters = chapters.where((c) => c.isDownloaded).length;
    
    return Column(
      children: [
        // 打开网页按钮
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () => _openMangaWebPage(manga.mangaId),
            icon: const Icon(Icons.open_in_browser, size: 14),
            label: const Text('跳转地址'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              elevation: 1,
            ),
          ),
        ),
        const SizedBox(height: 6),
        // 统计信息 - 紧凑布局
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatItem(Icons.book, '${totalChapters}话'),
              _buildStatItem(Icons.download_done, '${downloadedChapters}已下载'),
              _buildStatItem(Icons.favorite_border, '${manga.favoriteCount}'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatItem(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 12, color: Colors.grey[600]),
        const SizedBox(width: 2),
        Text(
          text,
          style: TextStyle(
            fontSize: 10,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  /// 打开漫画网页
  Future<void> _openMangaWebPage(String mangaId) async {
    try {
      final url = 'https://komiic.com/comic/$mangaId';
      
      if (Platform.isWindows) {
        // Windows平台使用start命令
        await Process.run('cmd', ['/c', 'start', url]);
      } else if (Platform.isMacOS) {
        // macOS平台使用open命令
        await Process.run('open', [url]);
      } else if (Platform.isLinux) {
        // Linux平台使用xdg-open命令
        await Process.run('xdg-open', [url]);
      } else {
        EasyLoading.showError('不支持的操作系统');
      }
    } catch (e) {
      EasyLoading.showError('打开链接失败: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectionMode ? '选择章节 (${_selectedChapterIds.length})' : '漫画详情'),
        actions: [
          if (_selectionMode) ...[
            PopupMenuButton<String>(
              onSelected: (value) {
                switch (value) {
                  case 'select_all':
                    _selectAllChapters(_currentChapters);
                    break;
                  case 'select_undownloaded':
                    _selectUndownloadedChapters(_currentChapters);
                    break;
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'select_all',
                  child: Row(
                    children: [
                      Icon(Icons.select_all),
                      SizedBox(width: 8),
                      Text('全选章节'),
                    ],
                  ),
                ),
                const PopupMenuItem(
                  value: 'select_undownloaded',
                  child: Row(
                    children: [
                      Icon(Icons.download),
                      SizedBox(width: 8),
                      Text('选择未下载'),
                    ],
                  ),
                ),
              ],
              icon: const Icon(Icons.more_vert),
              tooltip: '选择选项',
            ),
            IconButton(
              onPressed: _downloadSelectedChapters,
              icon: const Icon(Icons.download),
              tooltip: '下载选中章节',
            ),
            IconButton(
              onPressed: _toggleSelection,
              icon: const Icon(Icons.close),
              tooltip: '取消选择',
            ),
          ] else ...[
            IconButton(
              onPressed: _toggleSelection,
              icon: const Icon(Icons.checklist),
              tooltip: '选择章节',
            ),
            IconButton(
              onPressed: () async {
                final isar = await _isarFuture;
                final m = await isar.mangas.get(widget.mangaId);
                if (m == null) return;
                try {
                  EasyLoading.show(status: '检查更新...');
                  // 调用刷新：仓库内部会根据更新时间自动决定是否同步章节
                  await _repo.refreshMangaById(m.mangaId);
                  EasyLoading.dismiss();
                } catch (_) {
                  EasyLoading.dismiss();
                }
                if (mounted) setState(() {});
              },
              icon: const Icon(Icons.sync),
              tooltip: '检查并同步章节',
            ),
          ],
        ],
      ),
      body: FutureBuilder<Isar>(
        future: _isarFuture,
        builder: (context, isarSnap) {
          if (!isarSnap.hasData) return const Center(child: CircularProgressIndicator());
          final isar = isarSnap.data!;
          return FutureBuilder<(Manga?, List<Chapter>)>(
            future: _load(isar),
            builder: (context, snap) {
              if (!snap.hasData) return const Center(child: CircularProgressIndicator());
              final (manga, chapters) = snap.data!;
              if (manga == null) return const Center(child: Text('未找到漫画'));
              return CustomScrollView(
                slivers: [
                  // 头部信息区域
                  SliverToBoxAdapter(
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          // 标题区域
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  manga.title.isEmpty ? manga.mangaId : manga.title,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                if (manga.otherTitles.isNotEmpty) ...[
                                  const SizedBox(height: 2),
                                  Text(
                                    manga.otherTitles.first,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ],
                            ),
                          ),
                          // 封面和元信息区域 - 左右布局
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // 封面图片
                                Container(
                                  width: 130,
                                  height: 170,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.12),
                                        blurRadius: 8,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: _cover(manga),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                // 元信息和按钮 - 右侧布局
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      _buildMetaInfo(manga),
                                      const SizedBox(height: 8),
                                      _buildActionButtons(manga, chapters),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                  // 简介区域
                  if (manga.description != null && manga.description!.isNotEmpty)
                    SliverToBoxAdapter(
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '简介',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              manga.description!,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[700],
                                height: 1.4,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  // 分隔线
                  const SliverToBoxAdapter(
                    child: Divider(height: 1, color: Color(0xFFE0E0E0)),
                  ),
                  // 章节列表标题
                  SliverToBoxAdapter(
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                      child: Row(
                        children: [
                          const Text(
                            '话',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const Spacer(),
                          if (_selectionMode) ...[
                            Text(
                              '已选择 ${_selectedChapterIds.length} 个章节',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(width: 6),
                            ElevatedButton.icon(
                              onPressed: _downloadSelectedChapters,
                              icon: const Icon(Icons.download, size: 12),
                              label: const Text('下载选中'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                minimumSize: Size.zero,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  // 章节网格 - 响应式布局
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 60, // 固定章节框最大宽度
                        mainAxisSpacing: 6,
                        crossAxisSpacing: 6,
                        childAspectRatio: 0.9, // 固定宽高比
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final c = chapters[index];
                          final downloaded = c.isDownloaded;
                          final selected = _selectedChapterIds.contains(c.id);
                          
                          return InkWell(
                            borderRadius: BorderRadius.circular(8),
                            onTap: () {
                              if (_selectionMode) {
                                if (mounted) {
                                  setState(() {
                                    if (selected) {
                                      _selectedChapterIds.remove(c.id);
                                    } else {
                                      _selectedChapterIds.add(c.id);
                                    }
                                  });
                                }
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: selected 
                                    ? Colors.blue.withOpacity(0.15)
                                    : (downloaded ? Colors.green.withOpacity(0.1) : Colors.white),
                                border: Border.all(
                                  color: selected 
                                      ? Colors.blue
                                      : (downloaded ? Colors.green : Colors.grey[300]!),
                                  width: selected ? 2 : 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.06),
                                    blurRadius: 4,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                              ),
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // 章节号
                                  Text(
                                    c.chapterId,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: selected 
                                          ? Colors.blue
                                          : (downloaded ? Colors.green : Colors.black87),
                                    ),
                                  ),
                                  const SizedBox(height: 1),
                                  // 页数
                                  Text(
                                    '${c.totalPages}p',
                                    style: TextStyle(
                                      fontSize: 9,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  // 状态图标
                                  if (downloaded || selected) ...[
                                    const SizedBox(height: 1),
                                    Icon(
                                      downloaded ? Icons.check_circle : Icons.check_circle_outline,
                                      size: 12,
                                      color: downloaded ? Colors.green : Colors.blue,
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          );
                        },
                        childCount: chapters.length,
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

}


