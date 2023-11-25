import 'package:my_quran_id/features/quran/domain/entities/verse_entity.dart';

import '../../../../core/resources/data_state.dart';
import '../entities/surah_entity.dart';

abstract class QuranRepository {
  Future<DataState<List<SurahEntity>>> getAllSurah();

  Future<DataState<SurahEntity>> getSurahDetail(int surahNumber);

  Future<DataState<SurahEntity>> getSurahInterpretation(int surahNumber);

  Future<List<VerseEntity>> getBookmarkedVerses();

  Future<void> addVerseToBookmark(VerseEntity verse);

  Future<void> removeVerseFromBookmark(VerseEntity verse);
}
