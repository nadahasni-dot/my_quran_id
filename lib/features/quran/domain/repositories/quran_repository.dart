import 'package:my_quran_id/features/quran/domain/entities/verse_entity.dart';

import '../entities/surah_entity.dart';

abstract class QuranRepository {
  Future<List<SurahEntity>> getAllSurah();

  Future<SurahEntity> getSurahDetail(int surahNumber);

  Future<SurahEntity> getSurahInterpretation(int surahNumber);

  Future<List<VerseEntity>> getBookmarkedVerses();

  Future<void> addVerseToBookmark(VerseEntity verse);

  Future<void> removeVerseFromBookmark(VerseEntity verse);
}
