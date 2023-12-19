import '../../../../core/usecases/usecase.dart';
import '../entities/surah_entity.dart';
import '../repositories/quran_repository.dart';

class GetSurahDetailUseCase implements UseCase<SurahEntity, int> {
  final QuranRepository _quranRepository;

  GetSurahDetailUseCase(this._quranRepository);

  @override
  Future<SurahEntity> call({int? params}) =>
      _quranRepository.getSurahDetail(params!);
}
