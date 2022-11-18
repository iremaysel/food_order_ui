// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      email: json['email'] as String,
      id: json['id'] as int?,
      image: json['image'] as String?,
      role: json['role'] as String?,
      mobileUuid: json['mobileUuid'] as String?,
      address: json['address'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      reference: json['reference'] as String?,
      createdAt: json['createdAt'] as String?,
      isVerified: json['isVerified'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'email': instance.email,
      'id': instance.id,
      'image': instance.image,
      'role': instance.role,
      'mobileUuid': instance.mobileUuid,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'reference': instance.reference,
      'createdAt': instance.createdAt,
      'isVerified': instance.isVerified,
      'isDeleted': instance.isDeleted,
      'name': instance.name,
    };
