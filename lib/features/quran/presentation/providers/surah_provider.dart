import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/get_all_surah_usecase.dart';
import '../../../../injection_container.dart';

final surahProvider = FutureProvider((ref) async {
  final useCase = serviceLocator.get<GetAllSurahUseCase>();
  final response = await useCase.call();
  return response;
});
