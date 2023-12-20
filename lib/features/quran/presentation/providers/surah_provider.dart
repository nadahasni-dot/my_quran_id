import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/surah_entity.dart';
import '../../domain/usecases/get_all_surah_usecase.dart';
import '../../../../injection_container.dart';

final surahProvider = FutureProvider((ref) async {
  final useCase = serviceLocator.get<GetAllSurahUseCase>();
  final response = await useCase.call();
  return response;
});

class SearchSurahController extends StateNotifier<List> {
  SearchSurahController() : super([]);

  void onSearchSurah(String query, List<SurahEntity> data) {
    state = [];

    if (query.isNotEmpty) {
      final result = data.where((element) => element.namaLatin
          .toString()
          .toLowerCase()
          .contains(query.toLowerCase()));

      state.addAll(result);
    }
  }
}

final searchSurahControllerProvider =
    StateNotifierProvider<SearchSurahController, List>(
  (ref) => SearchSurahController(),
);
