class ChartModel {
  String? price;
  DateTime? time;

  @override
  String toString() {
    return 'ChartModel{price: $price, time: $time}';
  }

  ChartModel(this.price, this.time);
}