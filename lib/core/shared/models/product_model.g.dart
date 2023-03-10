// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      rating: json['rating'] as int?,
      isRecommended: json['isRecommended'] as bool?,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      image: json['img'] as String?,
      category: json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category'] as String),
      createdAt: json['createdAt'] as String?,
      isDeleted: json['isDeleted'] as bool?,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rating': instance.rating,
      'isRecommended': instance.isRecommended,
      'description': instance.description,
      'price': instance.price,
      'image': instance.image,
      'category': instance.category?.toJson(),
      'createdAt': instance.createdAt,
      'isDeleted': instance.isDeleted,
    };
