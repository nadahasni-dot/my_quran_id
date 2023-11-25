import '../../../../core/usecases/usecase.dart';
import '../entities/verse_entity.dart';
import '../repositories/quran_repository.dart';

class AddVerseToBookmarkUseCase extends UseCase<void, VerseEntity> {
  final QuranRepository _quranRepository;

  AddVerseToBookmarkUseCase(this._quranRepository);

  @override
  Future<void> call({VerseEntity? params}) {
    return _quranRepository.addVerseToBookmark(params!);
  }
}
