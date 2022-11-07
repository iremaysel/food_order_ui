import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../features/products/domain/entities/category.dart';
part 'product.g.dart';

@JsonSerializable(explicitToJson: true)
class Product extends Equatable {
  final String name;
  final List<Category> categories;
  final bool available;

  final int? rating;
  final String description;
  final int? quantity;
  final int price;
  final String? img;
  final bool? isDeleted;
  final String? id;

  const Product({
    required this.name,
    required this.categories,
    required this.available,
    this.rating,
    required this.description,
    this.quantity,
    required this.price,
    this.img,
    this.isDeleted,
    required this.id,
  });

  @override
  List<Object> get props {
    return [
      name,
      categories,
      available,
      rating ?? 0,
      description,
      quantity ?? 0,
      price,
      img ?? '',
      isDeleted ?? false,
      id ?? '',
    ];
  }

  Product copyWith({
    String? name,
    List<Category>? categories,
    bool? available,
    int? rating,
    String? description,
    int? quantity,
    int? price,
    String? img,
    bool? isDeleted,
    String? id,
  }) {
    return Product(
      name: name ?? this.name,
      categories: categories ?? this.categories,
      available: available ?? this.available,
      rating: rating ?? this.rating,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      img: img ?? this.img,
      isDeleted: isDeleted ?? this.isDeleted,
      id: id ?? this.id,
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
