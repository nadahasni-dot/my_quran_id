// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: library_private_types_in_public_api

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  VerseDao? _verseDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `bookmarked_verse` (`id` INTEGER, `surah` INTEGER, `nomor` INTEGER, `ar` TEXT, `tr` TEXT, `idn` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  VerseDao get verseDao {
    return _verseDaoInstance ??= _$VerseDao(database, changeListener);
  }
}

class _$VerseDao extends VerseDao {
  _$VerseDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _verseModelInsertionAdapter = InsertionAdapter(
            database,
            'bookmarked_verse',
            (VerseModel item) => <String, Object?>{
                  'id': item.id,
                  'surah': item.surah,
                  'nomor': item.nomor,
                  'ar': item.ar,
                  'tr': item.tr,
                  'idn': item.idn
                }),
        _verseModelDeletionAdapter = DeletionAdapter(
            database,
            'bookmarked_verse',
            ['id'],
            (VerseModel item) => <String, Object?>{
                  'id': item.id,
                  'surah': item.surah,
                  'nomor': item.nomor,
                  'ar': item.ar,
                  'tr': item.tr,
                  'idn': item.idn
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<VerseModel> _verseModelInsertionAdapter;

  final DeletionAdapter<VerseModel> _verseModelDeletionAdapter;

  @override
  Future<List<VerseModel>> getVerses() async {
    return _queryAdapter.queryList('SELECT * FROM bookmarked_verse',
        mapper: (Map<String, Object?> row) => VerseModel(
            id: row['id'] as int?,
            surah: row['surah'] as int?,
            nomor: row['nomor'] as int?,
            ar: row['ar'] as String?,
            tr: row['tr'] as String?,
            idn: row['idn'] as String?));
  }

  @override
  Future<void> insertVerse(VerseModel verse) async {
    await _verseModelInsertionAdapter.insert(verse, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteVerse(VerseModel verse) async {
    await _verseModelDeletionAdapter.delete(verse);
  }
}
