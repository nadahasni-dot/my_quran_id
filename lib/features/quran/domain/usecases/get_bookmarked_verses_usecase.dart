import '../../../../core/usecases/usecase.dart';
import '../entities/verse_entity.dart';
import '../repositories/quran_repository.dart';

class GetBookmarkedVersesUseCase implements UseCase<List<VerseEntity>, void> {
  final QuranRepository _quranRepository;

  GetBookmarkedVersesUseCase(this._quranRepository);

  @override
  Future<List<VerseEntity>> call({void params}) =>
      _quranRepository.getBookmarkedVerses();
}
