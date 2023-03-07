import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/user.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends User {
  const UserModel({
    required String email,
    required String fullName,
    required String role,
    required bool status,
    required bool google,
    required String uid,
  }) : super(
          email: email,
          fullName: fullName,
          role: email,
          status: status,
          google: google,
          uid: uid,
        );

  @override
  List<Object?> get props => [
        fullName,
        email,
        role,
        status,
        google,
        uid,
      ];

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
