import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
//  part 'category.g.dart';

@JsonSerializable()
class Category extends Equatable {
  const Category({
    required this.id,
    required this.name,
    required this.image,
    required this.isDeleted,
    required this.createdAt,
  });

  final int id;
  final String name;
  final String image;
  final bool isDeleted;
  final String createdAt;

  Category copyWith({
    int? id,
    String? reference,
    String? name,
    bool? isDeleted,
    String? createdAt,
  }) =>
      Category(
          id: id ?? this.id,
          image: reference ?? image,
          name: name ?? this.name,
          isDeleted: isDeleted ?? this.isDeleted,
          createdAt: createdAt ?? this.createdAt);

  @override
  List<Object?> get props => [id, image, name, isDeleted, createdAt];

  // factory Category.fromJson(Map<String, dynamic> json) =>
  //     _$CategoryFromJson(json);

  // /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  // Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
