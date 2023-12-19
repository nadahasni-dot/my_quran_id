import 'dart:async';
import 'package:floor/floor.dart';
// ignore: depend_on_referenced_packages
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../models/verse_model.dart';
import 'DAO/verse_dao.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [VerseModel])
abstract class AppDatabase extends FloorDatabase {
  VerseDao get verseDao;
}
