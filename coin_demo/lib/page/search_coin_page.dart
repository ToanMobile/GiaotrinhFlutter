import 'package:coin_demo/model/coin_model.dart';
import 'package:flutter/material.dart';

import 'coin_responsitory.dart';
import 'widget/widget_item.dart';

class SearchCoinPage extends StatefulWidget {
  const SearchCoinPage({Key? key}) : super(key: key);

  @override
  _SearchCoinPageState createState() => _SearchCoinPageState();
}

class _SearchCoinPageState extends State<SearchCoinPage> {
  List<CoinModel> listTopAll = List.empty();
  List<CoinModel> listSearch = List.empty();

  @override
  void initState() {
    super.initState();
    listTopAll = CoinResponsitory.listCoinModel;
    listSearch = listTopAll;
    //print('listCoinModel::'+ listTop5Coin.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            onChanged: (text) {
              listSearch = listTopAll.where((element) => element.name?.toLowerCase().contains(text) == true).toList();
              setState(() {});
            },
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, index) {
                return WidgetItemList(listSearch[index]);
              },
              itemCount: listSearch.length,
            ),
          ),
        ],
      ),
    );
  }
}
