import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/surah_entity.dart';
import '../../../../injection_container.dart';
import '../../domain/usecases/get_surah_detail_usecase.dart';

final detailSurahProvider = FutureProvider.family
    .autoDispose<SurahEntity, int>((ref, surahNumber) async {
  final useCase = serviceLocator.get<GetSurahDetailUseCase>();
  final response = await useCase.call(params: surahNumber);
  return response;
});
