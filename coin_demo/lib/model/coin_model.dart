import 'package:floor/floor.dart';

@entity
class CoinModel {
  CoinModel({
    this.id,
    this.symbol,
    this.name,
    this.image,
    this.marketCapRank,
    this.currentPrice,
    this.marketCapChangePercentage24h,
    this.athDate,
    this.lastUpdated,
  });

  @override
  String toString() {
    return 'CoinModel{name: $name, image: $image, currentPrice: $currentPrice, marketCapRank: $marketCapRank, marketCapChangePercentage24h: $marketCapChangePercentage24h}';
  }

  CoinModel.fromJson(dynamic json) {
    id = json['id'];
    symbol = json['symbol'];
    name = json['name'];
    image = json['image'];
    marketCapRank = json['market_cap_rank'].toString();
    currentPrice = json['current_price'].toString();
    marketCapChangePercentage24h = json['market_cap_change_percentage_24h'];
    athDate = json['ath_date'];
    lastUpdated = json['last_updated'];
  }

  @primaryKey
  String? id;
  String? symbol;
  String? name;
  String? image;
  String? marketCapRank;
  String? currentPrice;
  double? marketCapChangePercentage24h;
  String? athDate;
  String? lastUpdated;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['symbol'] = symbol;
    map['name'] = name;
    map['image'] = image;
    map['market_cap_rank'] = marketCapRank;
    map['current_price'] = currentPrice;
    map['market_cap_change_percentage_24h'] = marketCapChangePercentage24h;
    map['ath_date'] = athDate;
    map['last_updated'] = lastUpdated;
    return map;
  }
}
