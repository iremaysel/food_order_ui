import 'dart:convert';

import 'package:food_order_ui/features/products/data/models/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/category.dart';

@JsonSerializable()
class CategoryModel extends Category {
  const CategoryModel({
    required String id,
    required String name,
    required String reference,
    required List<ProductModel> products,
  }) : super(
          id: id,
          name: name,
          reference: reference,
          products: products,
        );

  // To parse this JSON data, do
//
//     final categoryModel = categoryModelFromMap(jsonString);

  factory CategoryModel.fromJson(String str) =>
      CategoryModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
        id: json["_id"],
        reference: json["reference"],
        name: json["name"],
        products: List<ProductModel>.from(json["products"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "reference": reference,
        "name": name,
        "products": List<dynamic>.from(products.map((x) => x)),
      };
}




  /// Connect the generated [_$PersonToJson] function to the `toJson` method.

