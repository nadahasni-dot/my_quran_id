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
    final searchSurahList = ref.watch(searchSurahControllerProvider);

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              onChanged: (value) => ref
                  .read(searchSurahControllerProvider.notifier)
                  .onSearchSurah(value, surahList.valueOrNull ?? []),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 16,
                ),
                hintText: "Cari surat",
                hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.normal,
                ),
                suffixIcon: const Icon(Icons.search_rounded),
                suffixIconColor: Colors.grey.shade500,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade500),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade500),
                ),
              ),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
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
                  itemCount: searchSurahList.isNotEmpty
                      ? searchSurahList.length
                      : data.length,
                  itemBuilder: (context, index) {
                    final surah = searchSurahList.isNotEmpty
                        ? searchSurahList[index]
                        : data[index];

                    return SurahItem(
                      onTap: () => context.pushNamed(
                        RouteLocation.surahScreen,
                        extra: surah,
                      ),
                      number: surah.nomor ?? 0,
                      name: surah.nama ?? '',
                      latinName: surah.namaLatin ?? '',
                      meaning: surah.arti ?? '',
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                      height: 1, thickness: 1, color: Colors.grey.shade300),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
