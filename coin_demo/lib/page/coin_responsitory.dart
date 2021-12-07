import 'package:coin_demo/model/coin_model.dart';
import 'package:dio/dio.dart';

class CoinResponsitory {
  static List<CoinModel> listCoinModel = List.empty();

  Future<void> getData() async {
    var dio = Dio();
    final response = (await dio.get('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false'));
    //final coinModel =  CoinModel.fromJson(response.data)
    listCoinModel = List<CoinModel>.from((response.data as List).map((e) => CoinModel.fromJson(e)));
    print('getData::'+ listCoinModel.toString());
  }
}