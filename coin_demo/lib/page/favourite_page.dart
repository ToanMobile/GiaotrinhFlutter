import 'package:coin_demo/model/coin_model.dart';
import 'package:coin_demo/page/coin_responsitory.dart';
import 'package:flutter/material.dart';

import 'widget/widget_item.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  CoinResponsitory coinResponsitory = CoinResponsitory();
  List<CoinModel> listCoinFavorite = List.empty();

  @override
  void initState() {
    super.initState();
    coinResponsitory.getAllFavorite().then((value) {
      listCoinFavorite = value;
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, index) {
        return WidgetItemList(listCoinFavorite[index]);
      },
      itemCount: listCoinFavorite.length,
    );
  }
}
