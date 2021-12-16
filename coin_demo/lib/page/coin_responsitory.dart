import 'dart:convert';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:coin_demo/model/chart_model.dart';
import 'package:coin_demo/model/coin_model.dart';
import 'package:coin_demo/model/entity/coin_dao.dart';
import 'package:coin_demo/model/entity/database.dart';
import 'package:dio/dio.dart';

class CoinResponsitory {
  static List<CoinModel> listCoinModel = List.empty();
  static CoinDao? coinDao;

  Future<void> initDatabase() async {
    final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    coinDao = database.coinDao;
  }

  Future<void> getData() async {
    var dio = Dio();
    final response = (await dio.get('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false'));
    listCoinModel = List<CoinModel>.from((response.data as List).map((e) => CoinModel.fromJson(e)));
  }

  Future<void> addFavorite(CoinModel? coinModel) async {
    coinDao?.insertCoin(coinModel!);
  }

  Future<void> removeFavorite(CoinModel? coinModel) async {
    coinDao?.removeCoin(coinModel!);
  }

  Future<bool> checkFavorite(CoinModel? coin) async {
    CoinModel? coinModel = await coinDao?.findCoinById(coin?.id ?? '0');
    if (coinModel != null) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  Future<List<CoinModel>> getAllFavorite() {
    return coinDao?.findAllCoin() ?? Future.value(List.empty());
  }

  Future<List<charts.Series<ChartModel, DateTime>>> getChart(String id, int hour) async {
    var dio = Dio();
    String from = (DateTime.now().subtract(Duration(hours: hour)).toUtc().millisecondsSinceEpoch / 1000).round().toString();
    String to = (DateTime.now().toUtc().millisecondsSinceEpoch / 1000).round().toString();
    final response = await dio.get('https://api.coingecko.com/api/v3/coins/$id/market_chart/range?vs_currency=usd&from=$from&to=$to');
    List<ChartModel> listChart = [];
    await jsonDecode(response.toString())['prices'].forEach((element) {
      listChart.add(ChartModel(element[1].toString(), DateTime.fromMillisecondsSinceEpoch(element[0])));
    });
    return Future.value([
      charts.Series<ChartModel, DateTime>(
        id: 'ChartCoin',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (ChartModel chart, _) => chart.time ?? DateTime.now(),
        measureFn: (ChartModel chart, _) => num.parse(chart.price ?? "0"),
        data: listChart,
      )
    ]);
  }
}
