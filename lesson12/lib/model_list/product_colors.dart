/// id : 11
/// name : "#ff0006"
/// hex : "#ff0006"

class Product_colors {
  Product_colors({
      this.id, 
      this.name, 
      this.hex,});

  Product_colors.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    hex = json['hex'];
  }
  int? id;
  String? name;
  String? hex;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['hex'] = hex;
    return map;
  }

}