import 'author.dart';
import 'product_sizes.dart';
import 'product_colors.dart';

/// id : 14
/// author : {"id":199,"name":"John Cena","email":"khoanda@gmail.com","phone":"+84369307754"}
/// name : "Quần jean nam mẫu 0021"
/// description : "Quần jean nam mẫu 0021"
/// selling_price : 400000
/// product_sizes : [{"id":505,"name":"30","attrs":{"height":["165","166"],"weight":["0","0"],"shoulder":["0","0"],"chest":["0","0"],"waist":["64","67"],"butt":["96","98"]}}]
/// image : "https://portal.ohrey.com.vn/storage/uploads/merchant/95faf33c5e81bf53a982a7d2a3897888.jpg"
/// like : false
/// product_colors : [{"id":11,"name":"#ff0006","hex":"#ff0006"}]
/// liked : false
/// status : "on_rent"

class Rents {
  Rents({
      this.id, 
      this.author, 
      this.name, 
      this.description, 
      this.sellingPrice, 
      this.productSizes, 
      this.image, 
      this.like, 
      this.productColors, 
      this.liked, 
      this.status,});

  @override
  String toString() {
    return 'Rents{id: $id, name: $name, description: $description, sellingPrice: $sellingPrice, image: $image, status: $status}';
  }

  Rents.fromJson(dynamic json) {
    id = json['id'];
    author = json['author'] != null ? Author.fromJson(json['author']) : null;
    name = json['name'];
    description = json['description'];
    sellingPrice = json['selling_price'];
    if (json['product_sizes'] != null) {
      productSizes = [];
      json['product_sizes'].forEach((v) {
        productSizes?.add(Product_sizes.fromJson(v));
      });
    }
    image = json['image'];
    like = json['like'];
    if (json['product_colors'] != null) {
      productColors = [];
      json['product_colors'].forEach((v) {
        productColors?.add(Product_colors.fromJson(v));
      });
    }
    liked = json['liked'];
    status = json['status'];
  }
  int? id;
  Author? author;
  String? name;
  String? description;
  int? sellingPrice;
  List<Product_sizes>? productSizes;
  String? image;
  bool? like;
  List<Product_colors>? productColors;
  bool? liked;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (author != null) {
      map['author'] = author?.toJson();
    }
    map['name'] = name;
    map['description'] = description;
    map['selling_price'] = sellingPrice;
    if (productSizes != null) {
      map['product_sizes'] = productSizes?.map((v) => v.toJson()).toList();
    }
    map['image'] = image;
    map['like'] = like;
    if (productColors != null) {
      map['product_colors'] = productColors?.map((v) => v.toJson()).toList();
    }
    map['liked'] = liked;
    map['status'] = status;
    return map;
  }

}