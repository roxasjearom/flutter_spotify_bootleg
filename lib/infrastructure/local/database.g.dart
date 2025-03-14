// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
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

  FavoriteTrackDao? _favoriteSongDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `FavoriteTrack` (`id` TEXT NOT NULL, `name` TEXT NOT NULL, `artist` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  FavoriteTrackDao get favoriteSongDao {
    return _favoriteSongDaoInstance ??=
        _$FavoriteTrackDao(database, changeListener);
  }
}

class _$FavoriteTrackDao extends FavoriteTrackDao {
  _$FavoriteTrackDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _favoriteTrackInsertionAdapter = InsertionAdapter(
            database,
            'FavoriteTrack',
            (FavoriteTrack item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'artist': item.artist
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<FavoriteTrack> _favoriteTrackInsertionAdapter;

  @override
  Stream<List<FavoriteTrack>> getAllFavoritesStream() {
    return _queryAdapter.queryListStream('SELECT * FROM FavoriteTrack',
        mapper: (Map<String, Object?> row) => FavoriteTrack(row['id'] as String,
            row['name'] as String, row['artist'] as String),
        queryableName: 'FavoriteTrack',
        isView: false);
  }

  @override
  Future<List<FavoriteTrack>> getFavorites() async {
    return _queryAdapter.queryList('SELECT * FROM FavoriteTrack',
        mapper: (Map<String, Object?> row) => FavoriteTrack(row['id'] as String,
            row['name'] as String, row['artist'] as String));
  }

  @override
  Stream<FavoriteTrack?> getSpecificFavorite(int id) {
    return _queryAdapter.queryStream(
        'SELECT * FROM FavoriteTrack WHERE id = ?1',
        mapper: (Map<String, Object?> row) => FavoriteTrack(row['id'] as String,
            row['name'] as String, row['artist'] as String),
        arguments: [id],
        queryableName: 'FavoriteTrack',
        isView: false);
  }

  @override
  Future<void> deleteFavorite(String id) async {
    await _queryAdapter.queryNoReturn('DELETE FROM FavoriteTrack where id = ?1',
        arguments: [id]);
  }

  @override
  Future<void> insertFavorite(FavoriteTrack song) async {
    await _favoriteTrackInsertionAdapter.insert(song, OnConflictStrategy.abort);
  }
}
