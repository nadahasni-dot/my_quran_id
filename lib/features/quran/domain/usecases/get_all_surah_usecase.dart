import '../../../../core/usecases/usecase.dart';
import '../entities/surah_entity.dart';
import '../repositories/quran_repository.dart';

class GetAllSurahUseCase implements UseCase<List<SurahEntity>, void> {
  final QuranRepository _quranRepository;

  GetAllSurahUseCase(this._quranRepository);

  @override
  Future<List<SurahEntity>> call({void params}) =>
      _quranRepository.getAllSurah();
}
