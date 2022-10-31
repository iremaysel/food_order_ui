import 'dart:convert';

import '../../../../core/shared/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required String name,
    required String categories,
    required bool available,
    required int rating,
    required String description,
    int? quantity,
    required int price,
    required String img,
    required String uid,
    String? calories,
  }) : super(
          name: name,
          categories: categories,
          available: available,
          rating: rating,
          description: description,
          quantity: quantity,
          price: price,
          img: img,
          uid: uid,
          calories: calories,
        );

  factory ProductModel.fromJson(String str) =>
      ProductModel.fromMap(json.decode(str));

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        name: json["name"],
        categories: json["categories"],
        available: json["available"],
        rating: json["rating"],
        description: json["description"],
        quantity: json["quantity"],
        price: json["price"],
        img: json["img"],
        calories: json["calories"],
        uid: json["uid"],
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "name": name,
        "categories": categories,
        "available": available,
        "rating": rating,
        "description": description,
        "quantity": quantity,
        "price": price,
        "img": img,
        "calories": calories,
        "uid": uid,
      };
}
