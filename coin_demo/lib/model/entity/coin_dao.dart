// dao/person_dao.dart

import 'package:floor/floor.dart';

import '../coin_model.dart';

@dao
abstract class CoinDao {
  @Query('SELECT * FROM CoinModel')
  Future<List<CoinModel>> findAllCoin();

  @Query('SELECT * FROM CoinModel WHERE id = :id')
  Future<CoinModel?> findCoinById(String id);

  @Query('DELETE * FROM CoinModel WHERE id = :id')
  Future<CoinModel?> deleteCoin(String id);

  @insert
  Future<void> insertCoin(CoinModel coinModel);

  @delete
  Future<void> removeCoin(CoinModel coinModel);
}