import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/surah_entity.dart';
import '../providers/detail_surah_provider.dart';
import '../widgets/surah_player_sheet.dart';
import '../widgets/verse_item.dart';

class SurahScreen extends ConsumerWidget {
  const SurahScreen({super.key});

  void _openAudioSheet(context, {audioUrl, name}) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SurahPlayerSheet(audioUrl: audioUrl, name: name),
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final extra = GoRouterState.of(context).extra! as SurahEntity;
    final appBarTitle = extra.namaLatin ?? '';

    final detailSurah = ref.watch(detailSurahProvider(extra.nomor!));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey.shade800,
        title: Text(appBarTitle),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
        actions: [
          IconButton(
            onPressed: () => _openAudioSheet(
              context,
              name: extra.namaLatin,
              audioUrl: extra.audio!,
            ),
            icon: const Icon(Icons.play_arrow_rounded),
          )
        ],
        elevation: 1,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(detailSurahProvider(extra.nomor!));
        },
        child: detailSurah.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, stacktrace) => Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                e.toString(),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          data: (data) => ListView.separated(
            itemCount: data.ayat!.length,
            itemBuilder: (context, index) => VerseItem(
              number: data.ayat![index].nomor ?? 0,
              arabic: data.ayat![index].ar ?? '',
              translation: data.ayat![index].idn ?? '',
            ),
            separatorBuilder: (context, index) =>
                Divider(height: 1, thickness: 1, color: Colors.grey.shade300),
          ),
        ),
      ),
    );
  }
}
