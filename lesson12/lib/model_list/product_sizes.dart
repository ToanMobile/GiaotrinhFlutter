import 'attrs.dart';

/// id : 505
/// name : "30"
/// attrs : {"height":["165","166"],"weight":["0","0"],"shoulder":["0","0"],"chest":["0","0"],"waist":["64","67"],"butt":["96","98"]}

class Product_sizes {
  Product_sizes({
      this.id, 
      this.name, 
      this.attrs,});

  Product_sizes.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    attrs = json['attrs'] != null ? Attrs.fromJson(json['attrs']) : null;
  }
  int? id;
  String? name;
  Attrs? attrs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    if (attrs != null) {
      map['attrs'] = attrs?.toJson();
    }
    return map;
  }

}