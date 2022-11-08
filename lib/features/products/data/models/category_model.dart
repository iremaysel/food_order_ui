import 'package:food_order_ui/features/products/data/models/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/category.dart';

part 'category_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoryModel extends Category {
  const CategoryModel({
    required String id,
    required String reference,
    required String name,
    required List<String> products,
  }) : super(
          id: id,
          name: name,
          products: products,
          reference: reference,
        );

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  @override
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
