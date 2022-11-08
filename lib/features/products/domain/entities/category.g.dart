// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['_id'] as String,
      reference: json['reference'] as String,
      name: json['name'] as String,
      products:
          (json['products'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      '_id': instance.id,
      'reference': instance.reference,
      'name': instance.name,
      'products': instance.products,
    };
