import '../../../../core/usecases/usecase.dart';
import '../entities/verse_entity.dart';
import '../repositories/quran_repository.dart';

class RemoveVerseFromBookmarkUseCase extends UseCase<void, VerseEntity> {
  final QuranRepository _quranRepository;

  RemoveVerseFromBookmarkUseCase(this._quranRepository);

  @override
  Future<void> call({VerseEntity? params}) {
    return _quranRepository.removeVerseFromBookmark(params!);
  }
}
