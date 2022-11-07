import 'package:food_order_ui/features/products/data/models/category_model.dart';

import '../../../../core/shared/entities/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductModel extends Product {
  const ProductModel({
    required String name,
    required List<CategoryModel> categories,
    required bool available,
    int? rating,
    required String description,
    int? quantity,
    required int price,
    String? img,
    required bool isDeleted,
    String? id,
  }) : super(
          name: name,
          categories: categories,
          available: available,
          rating: rating,
          description: description,
          quantity: quantity,
          price: price,
          img: img,
          isDeleted: isDeleted,
          id: id,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  @override
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
