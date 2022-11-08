// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      name: json['name'] as String,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      available: json['available'] as bool,
      rating: json['rating'] as int?,
      description: json['description'] as String,
      quantity: json['quantity'] as int?,
      price: json['price'] as int,
      img: json['img'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'name': instance.name,
      'categories': instance.categories.map((e) => e.toJson()).toList(),
      'available': instance.available,
      'rating': instance.rating,
      'description': instance.description,
      'quantity': instance.quantity,
      'price': instance.price,
      'img': instance.img,
      'isDeleted': instance.isDeleted,
      'id': instance.id,
    };