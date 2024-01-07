// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      email: json['email'] as String,
      fullName: json['fullname'] as String,
      role: json['rol'] as String,
      status: json['status'] as bool,
      google: json['google'] as bool,
      isDeleted: json['isDeleted'] as bool,
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'email': instance.email,
      'fullname': instance.fullName,
      'rol': instance.role,
      'status': instance.status,
      'google': instance.google,
      'isDeleted': instance.isDeleted,
      'uid': instance.uid,
    };
