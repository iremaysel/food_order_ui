import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String uid;
  final String fullname;
  final String email;
  final String rol;
  final bool status;
  final bool? google;

  const User({
    required this.uid,
    required this.fullname,
    required this.email,
    required this.rol,
    required this.status,
    this.google,
  });

  @override
  List<Object?> get props => [
        uid,
        fullname,
        email,
        rol,
        status,
        google,
      ];
}
