/// id : 199
/// name : "John Cena"
/// email : "khoanda@gmail.com"
/// phone : "+84369307754"

class Author {
  Author({
      this.id, 
      this.name, 
      this.email, 
      this.phone,});

  Author.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
  }
  int? id;
  String? name;
  String? email;
  String? phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    return map;
  }

}