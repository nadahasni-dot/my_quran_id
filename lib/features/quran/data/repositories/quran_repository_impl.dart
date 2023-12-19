import 'dart:developer';
import 'dart:io';

import 'package:my_quran_id/features/quran/data/models/verse_model.dart';
import 'package:my_quran_id/features/quran/domain/entities/surah_entity.dart';

import 'package:my_quran_id/features/quran/domain/entities/verse_entity.dart';

import '../../domain/repositories/quran_repository.dart';
import '../data_sources/local/app_database.dart';
import '../data_sources/network/quran_api_service.dart';

class QuranRepositoryImpl extends QuranRepository {
  final QuranApiService _quranApiService;
  final AppDatabase _appDatabase;

  QuranRepositoryImpl(this._quranApiService, this._appDatabase);

  @override
  Future<void> addVerseToBookmark(VerseEntity verse) {
    return _appDatabase.verseDao.insertVerse(VerseModel.fromEntity(verse));
  }

  @override
  Future<List<SurahEntity>> getAllSurah() async {
    try {
      final httpResponse = await _quranApiService.getAllSurah();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return httpResponse.data;
      }

      throw const FormatException();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<VerseEntity>> getBookmarkedVerses() {
    return _appDatabase.verseDao.getVerses();
  }

  @override
  Future<SurahEntity> getSurahDetail(int surahNumber) async {
    try {
      final httpResponse =
          await _quranApiService.getSurahDetail(surahNumber.toString());

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return httpResponse.data;
      }

      throw const FormatException();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<SurahEntity> getSurahInterpretation(int surahNumber) async {
    try {
      final httpResponse = await _quranApiService
          .getInterpretationDetail(surahNumber.toString());

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return httpResponse.data;
      }

      throw const FormatException();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> removeVerseFromBookmark(VerseEntity verse) {
    return _appDatabase.verseDao.deleteVerse(VerseModel.fromEntity(verse));
  }
}
