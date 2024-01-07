part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterButtonPressed extends RegisterEvent {
  final String email;
  final String password;
  final String fullname;

  const RegisterButtonPressed({
    required this.fullname,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password, fullname];

  @override
  String toString() =>
      'LoginButtonPressed { username: $email, password: $password , fullname: $fullname}';
}
