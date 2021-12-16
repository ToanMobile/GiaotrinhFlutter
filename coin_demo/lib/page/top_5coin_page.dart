import 'package:coin_demo/model/coin_model.dart';
import 'package:coin_demo/page/widget/widget_item.dart';
import 'package:flutter/material.dart';

import 'coin_responsitory.dart';

class Top5CoinPage extends StatefulWidget {
  Top5CoinPage({Key? key}) : super(key: key);

  @override
  _Top5CoinPageState createState() => _Top5CoinPageState();
}

class _Top5CoinPageState extends State<Top5CoinPage> {
  List<CoinModel> listTopAll = List.empty();
  List<CoinModel> listTop5Coin = List.empty();

  @override
  void initState() {
    super.initState();
    listTopAll = CoinResponsitory.listCoinModel;
    listTopAll.sort((a, b) => (b.marketCapChangePercentage24h ?? 0).compareTo((a.marketCapChangePercentage24h ?? 0)));
    listTop5Coin = listTopAll.take(5).toList();
    print('listCoinModel::' + listTop5Coin.toString());
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, index) {
        return WidgetItemList(listTop5Coin[index]);
      },
      itemCount: listTop5Coin.length,
    );
  }
}
