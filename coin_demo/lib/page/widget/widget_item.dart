import 'package:coin_demo/model/coin_model.dart';
import 'package:coin_demo/utils/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../details_page.dart';

class WidgetItemList extends StatelessWidget {
  WidgetItemList(this.item, {Key? key}) : super(key: key);
  CoinModel? item;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailsPage(item)),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
        margin: EdgeInsets.only(top: 10.w, left: 10.w, right: 10.w),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.all(Radius.circular(10.t)),
        ),
        child: Row(
          children: [
            SizedBox(width: 20.w, child: Text(item?.marketCapRank.toString() ?? '', style: TextStyle(fontSize: 14.t, fontWeight: FontWeight.bold))),
            SizedBox(width: 10.w),
            Image.network(item?.image ?? '', width: 50.w, height: 50.w),
            SizedBox(width: 10.w),
            Expanded(child: Text(item?.name ?? '', style: TextStyle(fontSize: 20.t, fontWeight: FontWeight.bold))),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('${item?.currentPrice ?? '0'} \$', style: TextStyle(fontSize: 20.t, fontWeight: FontWeight.bold)),
                Text(item?.marketCapChangePercentage24h != null ? '${item?.marketCapChangePercentage24h}%' : '',
                    style: TextStyle(fontSize: 14, color: (item?.marketCapChangePercentage24h ?? 0) > 0 ? Colors.green : Colors.red, fontWeight: FontWeight.bold)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
