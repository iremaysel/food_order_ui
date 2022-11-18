// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as int?,
      name: json['name'] as String?,
      rating: json['rating'] as int?,
      isRecommended: json['isRecommended'] as bool?,
      category: json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      image: json['image'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
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
