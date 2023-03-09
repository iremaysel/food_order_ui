part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object?> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSussess extends RegisterState {
  final User user;
  final String token;

  const RegisterSussess({required this.user, required this.token});

  @override
  List<Object> get props => [user, token];
}

class RegisterError extends RegisterState {
  final String? message;

  const RegisterError({this.message});
  @override
  List<Object?> get props => [message];
}
