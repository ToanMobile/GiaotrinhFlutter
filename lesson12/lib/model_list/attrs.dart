/// height : ["165","166"]
/// weight : ["0","0"]
/// shoulder : ["0","0"]
/// chest : ["0","0"]
/// waist : ["64","67"]
/// butt : ["96","98"]

class Attrs {
  Attrs({
      this.height, 
      this.weight, 
      this.shoulder, 
      this.chest, 
      this.waist, 
      this.butt,});

  Attrs.fromJson(dynamic json) {
    height = json['height'] != null ? json['height'].cast<String>() : [];
    weight = json['weight'] != null ? json['weight'].cast<String>() : [];
    shoulder = json['shoulder'] != null ? json['shoulder'].cast<String>() : [];
    chest = json['chest'] != null ? json['chest'].cast<String>() : [];
    waist = json['waist'] != null ? json['waist'].cast<String>() : [];
    butt = json['butt'] != null ? json['butt'].cast<String>() : [];
  }
  List<String>? height;
  List<String>? weight;
  List<String>? shoulder;
  List<String>? chest;
  List<String>? waist;
  List<String>? butt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['height'] = height;
    map['weight'] = weight;
    map['shoulder'] = shoulder;
    map['chest'] = chest;
    map['waist'] = waist;
    map['butt'] = butt;
    return map;
  }

}