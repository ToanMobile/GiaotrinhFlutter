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

  CoinDao? _coinDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
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
            'CREATE TABLE IF NOT EXISTS `CoinModel` (`id` TEXT, `symbol` TEXT, `name` TEXT, `image` TEXT, `marketCapRank` TEXT, `currentPrice` TEXT, `marketCapChangePercentage24h` REAL, `athDate` TEXT, `lastUpdated` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CoinDao get coinDao {
    return _coinDaoInstance ??= _$CoinDao(database, changeListener);
  }
}

class _$CoinDao extends CoinDao {
  _$CoinDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _coinModelInsertionAdapter = InsertionAdapter(
            database,
            'CoinModel',
            (CoinModel item) => <String, Object?>{
                  'id': item.id,
                  'symbol': item.symbol,
                  'name': item.name,
                  'image': item.image,
                  'marketCapRank': item.marketCapRank,
                  'currentPrice': item.currentPrice,
                  'marketCapChangePercentage24h':
                      item.marketCapChangePercentage24h,
                  'athDate': item.athDate,
                  'lastUpdated': item.lastUpdated
                }),
        _coinModelDeletionAdapter = DeletionAdapter(
            database,
            'CoinModel',
            ['id'],
            (CoinModel item) => <String, Object?>{
                  'id': item.id,
                  'symbol': item.symbol,
                  'name': item.name,
                  'image': item.image,
                  'marketCapRank': item.marketCapRank,
                  'currentPrice': item.currentPrice,
                  'marketCapChangePercentage24h':
                      item.marketCapChangePercentage24h,
                  'athDate': item.athDate,
                  'lastUpdated': item.lastUpdated
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CoinModel> _coinModelInsertionAdapter;

  final DeletionAdapter<CoinModel> _coinModelDeletionAdapter;

  @override
  Future<List<CoinModel>> findAllCoin() async {
    return _queryAdapter.queryList('SELECT * FROM CoinModel',
        mapper: (Map<String, Object?> row) => CoinModel(
            id: row['id'] as String?,
            symbol: row['symbol'] as String?,
            name: row['name'] as String?,
            image: row['image'] as String?,
            marketCapRank: row['marketCapRank'] as String?,
            currentPrice: row['currentPrice'] as String?,
            marketCapChangePercentage24h:
                row['marketCapChangePercentage24h'] as double?,
            athDate: row['athDate'] as String?,
            lastUpdated: row['lastUpdated'] as String?));
  }

  @override
  Future<CoinModel?> findCoinById(String id) async {
    return _queryAdapter.query('SELECT * FROM CoinModel WHERE id = ?1',
        mapper: (Map<String, Object?> row) => CoinModel(
            id: row['id'] as String?,
            symbol: row['symbol'] as String?,
            name: row['name'] as String?,
            image: row['image'] as String?,
            marketCapRank: row['marketCapRank'] as String?,
            currentPrice: row['currentPrice'] as String?,
            marketCapChangePercentage24h:
                row['marketCapChangePercentage24h'] as double?,
            athDate: row['athDate'] as String?,
            lastUpdated: row['lastUpdated'] as String?),
        arguments: [id]);
  }

  @override
  Future<CoinModel?> deleteCoin(String id) async {
    return _queryAdapter.query('DELETE * FROM CoinModel WHERE id = ?1',
        mapper: (Map<String, Object?> row) => CoinModel(
            id: row['id'] as String?,
            symbol: row['symbol'] as String?,
            name: row['name'] as String?,
            image: row['image'] as String?,
            marketCapRank: row['marketCapRank'] as String?,
            currentPrice: row['currentPrice'] as String?,
            marketCapChangePercentage24h:
                row['marketCapChangePercentage24h'] as double?,
            athDate: row['athDate'] as String?,
            lastUpdated: row['lastUpdated'] as String?),
        arguments: [id]);
  }

  @override
  Future<void> insertCoin(CoinModel coinModel) async {
    await _coinModelInsertionAdapter.insert(
        coinModel, OnConflictStrategy.abort);
  }

  @override
  Future<void> removeCoin(CoinModel coinModel) async {
    await _coinModelDeletionAdapter.delete(coinModel);
  }
}
