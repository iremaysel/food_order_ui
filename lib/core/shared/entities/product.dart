// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:food_order_ui/features/products/data/models/category_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable(explicitToJson: true)
class Product extends Equatable {
  final int? id;
  final String? name;
  final int? rating;
  final bool? isRecommended;
  final String? description;
  final double? price;
  final String? image;
  final CategoryModel? category;

  final String? createdAt;
  final bool? isDeleted;

  const Product({
    this.id,
    this.name,
    this.rating,
    this.isRecommended,
    this.category,
    this.description,
    this.price,
    this.image,
    this.isDeleted,
    this.createdAt,
  });

  @override
  List<Object?> get props {
    return [
      id,
      name,
      category,
      rating,
      description,
      price,
      image,
      isDeleted,
      createdAt,
      isRecommended
    ];
  }

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ProductToJson(this);

  Product copyWith({
    int? id,
    String? name,
    int? rating,
    bool? isRecommended,
    String? description,
    double? price,
    String? image,
    CategoryModel? category,
    String? createdAt,
    bool? isDeleted,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      rating: rating ?? this.rating,
      isRecommended: isRecommended ?? this.isRecommended,
      description: description ?? this.description,
      price: price ?? this.price,
      image: image ?? this.image,
      category: category ?? this.category,
      createdAt: createdAt ?? this.createdAt,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }
}
