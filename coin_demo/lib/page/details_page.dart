import 'package:charts_flutter/flutter.dart' as charts;
import 'package:coin_demo/model/chart_model.dart';
import 'package:coin_demo/model/coin_model.dart';
import 'package:flutter/material.dart';

import 'coin_responsitory.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage(this.item, {Key? key}) : super(key: key);
  CoinModel? item;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<charts.Series<ChartModel, DateTime>> historyCoin = List.empty();
  bool isFavoriteCheck = false;
  CoinResponsitory coinResponsitory = CoinResponsitory();
  int type = 0;

  @override
  void initState() {
    super.initState();
    syncData();
  }

  void syncData() async {
    coinResponsitory.checkFavorite(widget.item).then((isFavorite) {
      isFavoriteCheck = isFavorite;
      syncHistory(1);
    });
  }

  void syncHistory(int hours) async {
    type = hours;
    historyCoin = await coinResponsitory.getChart(widget.item?.id ?? '', hours);
    setState(() {});
  }

  void clickFavorite() {
    coinResponsitory.checkFavorite(widget.item).then((isFavorite) {
      if (isFavorite) {
        coinResponsitory.removeFavorite(widget.item);
        setState(() {
          isFavoriteCheck = false;
        });
      } else {
        coinResponsitory.addFavorite(widget.item);
        setState(() {
          isFavoriteCheck = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.item?.name ?? '',
                style: const TextStyle(fontSize: 30),
              ),
              IconButton(
                onPressed: () => clickFavorite(),
                icon: Icon(
                  isFavoriteCheck ? Icons.favorite : Icons.favorite_border,
                  size: 30,
                ),
              ),
              Expanded(
                child: Center(
                  child: charts.TimeSeriesChart(
                    historyCoin,
                    animate: true,
                    dateTimeFactory: const charts.LocalDateTimeFactory(),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () => syncHistory(8),
                      child: Text(
                        '8h',
                        style: TextStyle(color: type == 8 ? Colors.red : Colors.black),
                      )),
                  TextButton(onPressed: () => syncHistory(20), child: Text('20h', style: TextStyle(color: type == 20 ? Colors.red : Colors.black))),
                  TextButton(onPressed: () => syncHistory(500), child: Text('500h', style: TextStyle(color: type == 500 ? Colors.red : Colors.black))),
                  TextButton(onPressed: () => syncHistory(1000), child: Text('1000h', style: TextStyle(color: type == 1000 ? Colors.red : Colors.black))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
