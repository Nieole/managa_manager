import 'dart:io';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../models/chapter.dart';
import '../models/manga.dart';
import '../services/isar_service.dart';
import '../repositories/manga_repository.dart';

class MangaDetailPage extends StatefulWidget {
  const MangaDetailPage({super.key, required this.mangaId});
  final Id mangaId;

  @override
  State<MangaDetailPage> createState() => _MangaDetailPageState();
}

class _MangaDetailPageState extends State<MangaDetailPage> {
  late Future<Isar> _isarFuture;
  late MangaRepository _repo;

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

  Future<(Manga?, List<Chapter>)> _load(Isar isar) async {
    final manga = await isar.mangas.get(widget.mangaId);
    if (manga == null) return (null, <Chapter>[]);
    await manga.chapters.load();
    final chapters = manga.chapters.toList()..sort((a, b) => a.orderIndex.compareTo(b.orderIndex));
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
      width: 120,
      height: 160,
      color: Colors.grey[300],
      child: const Icon(Icons.image, color: Colors.grey),
    );
    if (m.coverLocalPath.isNotEmpty) {
      final f = File(m.coverLocalPath);
      if (f.existsSync()) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: FittedBox(fit: BoxFit.contain, child: Image.file(f)),
        );
      }
    }
    if (m.imageUrl.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(m.imageUrl, width: 120, height: 160, fit: BoxFit.cover),
      );
    }
    return box;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('漫画详情'),
        actions: [
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
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _cover(manga),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  manga.title.isEmpty ? manga.mangaId : manga.title,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                const SizedBox(height: 6),
                                Wrap(
                                  spacing: 10,
                                  runSpacing: 6,
                                  children: [
                                    _meta('状态', _statusToZh(manga.status)),
                                    if (manga.year > 0) _meta('年份', '${manga.year}'),
                                    if (manga.author.isNotEmpty) _meta('作者', manga.author),
                                    if (manga.dateUpdated != null)
                                      _meta('更新', manga.updatedAt != null
                                          ? '${manga.updatedAt!.toLocal().year}-${manga.updatedAt!.toLocal().month.toString().padLeft(2, '0')}-${manga.updatedAt!.toLocal().day.toString().padLeft(2, '0')}'
                                          : ''),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                if (manga.description != null && manga.description!.isNotEmpty)
                                  Text(
                                    manga.description!,
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.grey[700]),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    sliver: SliverGrid(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 8,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 2.2,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final c = chapters[index];
                          final downloaded = c.isDownloaded;
                          final label = c.title.isNotEmpty ? c.title : c.chapterId;
                          return InkWell(
                            borderRadius: BorderRadius.circular(8),
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                color: downloaded ? Colors.green.withOpacity(0.15) : Theme.of(context).colorScheme.surface,
                                border: Border.all(color: downloaded ? Colors.green : Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (downloaded) const Icon(Icons.check_circle, size: 16, color: Colors.green),
                                  if (downloaded) const SizedBox(width: 4),
                                  Flexible(
                                    child: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis),
                                  ),
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

  Widget _meta(String k, String v) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('$k: ', style: TextStyle(color: Colors.grey[600])),
          Text(v),
        ],
      ),
    );
  }
}


