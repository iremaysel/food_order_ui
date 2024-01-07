part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSussess extends LoginState {
  final User user;
  final String token;

  const LoginSussess({required this.user, required this.token});

  @override
  List<Object> get props => [user, token];
}

class LoginError extends LoginState {
  final String? message;

  const LoginError(this.message);
  @override
  List<Object?> get props => [message];
}
