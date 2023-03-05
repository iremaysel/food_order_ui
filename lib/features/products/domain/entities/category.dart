import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/shared/entities/product.dart';
//  part 'category.g.dart';

@JsonSerializable()
class Category extends Equatable {
  const Category(
      {required this.id,
      required this.name,
      required this.reference,
      required this.products});

  final String id;
  final String name;

  final List<Product> products;
  final String reference;

  Category copyWith({
    String? id,
    String? reference,
    String? name,
    List<Product>? products,
  }) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        reference: reference ?? this.reference,
        products: products ?? this.products,
      );

  @override
  List<Object?> get props => [id, name, products, reference];

  // factory Category.fromJson(Map<String, dynamic> json) =>
  //     _$CategoryFromJson(json);

  // /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  // Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
