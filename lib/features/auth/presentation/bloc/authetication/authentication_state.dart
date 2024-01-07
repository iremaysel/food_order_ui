part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationUninitialized extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {
  final User user;
  final String token;

  const AuthenticationAuthenticated({
    required this.user,
    required this.token,
  });
  @override
  List<Object> get props => [user, token];
}

class AuthenticationUnauthenticated extends AuthenticationState {}
