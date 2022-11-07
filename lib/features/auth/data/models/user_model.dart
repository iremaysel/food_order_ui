import 'dart:convert';

import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required String uid,
    required String fullName,
    required String email,
    required String rol,
    required bool status,
    bool? google,
  }) : super(
          uid: uid,
          fullname: fullName,
          email: email,
          rol: rol,
          status: status,
          google: google,
        );

  @override
  List<Object?> get props => [
        uid,
        fullname,
        email,
        rol,
        status,
        google,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'fullname': fullname,
      'email': email,
      'rol': rol,
      'status': status,
      'google': google,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        uid: map['uid'],
        fullName: map['fullname'],
        email: map['email'],
        rol: map['rol'],
        status: map['status'],
        google: map['google']);
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
