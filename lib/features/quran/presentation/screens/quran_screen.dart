import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../configs/routes/route_location.dart';
import '../providers/surah_provider.dart';
import '../widgets/surah_item.dart';

class QuranScreen extends ConsumerWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final surahList = ref.watch(surahProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey.shade800,
        title: const Text('Quran'),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
        elevation: 1,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(surahProvider);
        },
        child: surahList.when(
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
            itemCount: data.length,
            itemBuilder: (context, index) => SurahItem(
              onTap: () => context.pushNamed(
                RouteLocation.surahScreen,
                extra: data[index],
              ),
              number: data[index].nomor ?? 0,
              name: data[index].nama ?? '',
              latinName: data[index].namaLatin ?? '',
              meaning: data[index].arti ?? '',
            ),
            separatorBuilder: (context, index) =>
                Divider(height: 1, thickness: 1, color: Colors.grey.shade300),
          ),
        ),
      ),
    );
  }
}
