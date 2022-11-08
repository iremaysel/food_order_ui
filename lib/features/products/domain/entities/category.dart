import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../core/shared/entities/product.dart';
part 'category.g.dart';

@JsonSerializable(explicitToJson: true)
class Category extends Equatable {
  const Category({
    required this.id,
    required this.reference,
    required this.name,
    required this.products,
  });

  final String id;
  final String reference;
  final String name;
  final List<String> products;

  Category copyWith({
    String? id,
    String? reference,
    String? name,
    List<String>? products,
    int? v,
  }) =>
      Category(
        id: id ?? this.id,
        reference: reference ?? this.reference,
        name: name ?? this.name,
        products: products ?? this.products,
      );

  @override
  List<Object?> get props => [id, reference, name, products];

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
