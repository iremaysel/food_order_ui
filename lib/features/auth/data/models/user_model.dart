import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/user.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends User {
  const UserModel({
    required String email,
    int? id,
    String? image,
    String? role,
    String? mobileUuid,
    String? address,
    String? phoneNumber,
    String? reference,
    String? createdAt,
    bool? isVerified,
    bool? isDeleted,
    String? name,
  }) : super(
            email: email,
            id: id,
            image: image,
            role: role,
            mobileUuid: mobileUuid,
            address: address,
            phoneNumber: phoneNumber,
            reference: reference,
            createdAt: createdAt,
            isDeleted: isDeleted,
            isVerified: isVerified,
            name: name);

  @override
  List<Object?> get props => [
        email,
        id,
        image,
        role,
        mobileUuid,
        address,
        phoneNumber,
        reference,
        createdAt,
        isVerified,
        isDeleted,
        name,
      ];

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
