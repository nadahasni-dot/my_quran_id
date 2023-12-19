import 'package:floor/floor.dart';

import '../../../models/verse_model.dart';

@dao
abstract class VerseDao {
  @Insert()
  Future<void> insertVerse(VerseModel verse);

  @delete
  Future<void> deleteVerse(VerseModel verse);

  @Query("SELECT * FROM bookmarked_verse")
  Future<List<VerseModel>> getVerses();
}
