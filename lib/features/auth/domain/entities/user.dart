import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String email;
  final int? id;
  final String? image;
  final String? role;
  final String? mobileUuid;
  final String? address;
  final String? phoneNumber;
  final String? reference;
  final String? createdAt;
  final bool? isVerified;
  final bool? isDeleted;
  final String? name;

  const User({
    required this.email,
    this.id,
    this.image,
    this.role,
    this.mobileUuid,
    this.address,
    this.phoneNumber,
    this.reference,
    this.createdAt,
    this.isVerified,
    this.isDeleted,
    this.name,
  });

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
}
