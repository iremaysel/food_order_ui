import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? fullName;
  final String email;
  final String? role;
  final bool? status;
  final bool? google;
  final String? uid;

  const User({
    this.fullName,
    required this.email,
    this.role,
    this.status,
    this.google,
    this.uid,
  });

  @override
  List<Object?> get props => [
        fullName,
        email,
        role,
        status,
        google,
        uid,
      ];
}
