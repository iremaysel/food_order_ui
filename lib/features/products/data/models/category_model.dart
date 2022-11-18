import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/category.dart';

part 'category_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoryModel extends Category {
  const CategoryModel({
    required int id,
    required String name,
    String? image,
    required bool isDeleted,
    required String createdAt,
  }) : super(
            id: id,
            name: name,
            image: image ?? '',
            createdAt: createdAt,
            isDeleted: isDeleted);

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
