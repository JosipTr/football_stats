// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

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

  PlayerDao? _playerDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `Player` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `surname` TEXT NOT NULL, `goals` INTEGER NOT NULL, `assists` INTEGER NOT NULL, `yellowCards` INTEGER NOT NULL, `redCards` INTEGER NOT NULL, `trainingDays` INTEGER NOT NULL, `overallTrainingDays` INTEGER NOT NULL, `matchesPlayed` INTEGER NOT NULL, `overallNumberOfMatches` INTEGER NOT NULL, `playedMinutes` REAL NOT NULL, `isSelected` INTEGER NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  PlayerDao get playerDao {
    return _playerDaoInstance ??= _$PlayerDao(database, changeListener);
  }
}

class _$PlayerDao extends PlayerDao {
  _$PlayerDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _playerInsertionAdapter = InsertionAdapter(
            database,
            'Player',
            (Player item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'surname': item.surname,
                  'goals': item.goals,
                  'assists': item.assists,
                  'yellowCards': item.yellowCards,
                  'redCards': item.redCards,
                  'trainingDays': item.trainingDays,
                  'overallTrainingDays': item.overallTrainingDays,
                  'matchesPlayed': item.matchesPlayed,
                  'overallNumberOfMatches': item.overallNumberOfMatches,
                  'playedMinutes': item.playedMinutes,
                  'isSelected': item.isSelected ? 1 : 0
                }),
        _playerUpdateAdapter = UpdateAdapter(
            database,
            'Player',
            ['id'],
            (Player item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'surname': item.surname,
                  'goals': item.goals,
                  'assists': item.assists,
                  'yellowCards': item.yellowCards,
                  'redCards': item.redCards,
                  'trainingDays': item.trainingDays,
                  'overallTrainingDays': item.overallTrainingDays,
                  'matchesPlayed': item.matchesPlayed,
                  'overallNumberOfMatches': item.overallNumberOfMatches,
                  'playedMinutes': item.playedMinutes,
                  'isSelected': item.isSelected ? 1 : 0
                }),
        _playerDeletionAdapter = DeletionAdapter(
            database,
            'Player',
            ['id'],
            (Player item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'surname': item.surname,
                  'goals': item.goals,
                  'assists': item.assists,
                  'yellowCards': item.yellowCards,
                  'redCards': item.redCards,
                  'trainingDays': item.trainingDays,
                  'overallTrainingDays': item.overallTrainingDays,
                  'matchesPlayed': item.matchesPlayed,
                  'overallNumberOfMatches': item.overallNumberOfMatches,
                  'playedMinutes': item.playedMinutes,
                  'isSelected': item.isSelected ? 1 : 0
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Player> _playerInsertionAdapter;

  final UpdateAdapter<Player> _playerUpdateAdapter;

  final DeletionAdapter<Player> _playerDeletionAdapter;

  @override
  Future<List<Player>> getPlayers() async {
    return _queryAdapter.queryList('SELECT * FROM Player',
        mapper: (Map<String, Object?> row) => Player(
            id: row['id'] as int?,
            name: row['name'] as String,
            surname: row['surname'] as String));
  }

  @override
  Future<void> addPlayer(Player player) async {
    await _playerInsertionAdapter.insert(player, OnConflictStrategy.abort);
  }

  @override
  Future<void> updatePlayer(Player player) async {
    await _playerUpdateAdapter.update(player, OnConflictStrategy.abort);
  }

  @override
  Future<void> removePlayer(Player player) async {
    await _playerDeletionAdapter.delete(player);
  }
}
