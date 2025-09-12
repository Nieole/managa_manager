import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

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
  final MangaRepository _repo = MangaRepository();

  @override
  void initState() {
    super.initState();
    _isarFuture = IsarService.getInstance();
  }

  Future<(Manga?, List<Chapter>)> _load(Isar isar) async {
    final manga = await isar.mangas.get(widget.mangaId);
    if (manga == null) return (null, <Chapter>[]);
    await manga.chapters.load();
    final chapters = manga.chapters.toList()..sort((a, b) => a.orderIndex.compareTo(b.orderIndex));
    return (manga, chapters);
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
              await _repo.syncChaptersFor(m.mangaId);
              if (mounted) setState(() {});
            },
            icon: const Icon(Icons.sync),
            tooltip: '同步章节',
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
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(manga.title.isEmpty ? manga.mangaId : manga.title, style: Theme.of(context).textTheme.titleLarge),
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: chapters.length,
                      separatorBuilder: (_, __) => const Divider(height: 1),
                      itemBuilder: (context, index) {
                        final c = chapters[index];
                        final progress = c.totalPages == 0 ? 0.0 : (c.downloadedPages / c.totalPages).clamp(0.0, 1.0);
                        return ListTile(
                          title: Text(c.title.isEmpty ? c.chapterId : c.title),
                          subtitle: c.totalPages > 0
                              ? LinearProgressIndicator(value: progress)
                              : const Text('未下载'),
                          trailing: c.isDownloaded ? const Icon(Icons.check, color: Colors.green) : null,
                        );
                      },
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


