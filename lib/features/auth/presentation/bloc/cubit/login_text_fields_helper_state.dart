// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_text_fields_helper_cubit.dart';

class LoginTextFieldsHelperState extends Equatable {
  final String email;
  final String password;
  final String username;

  const LoginTextFieldsHelperState({
    required this.username,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password, username];

  LoginTextFieldsHelperState copyWith({
    String? email,
    String? password,
    String? username,
  }) {
    return LoginTextFieldsHelperState(
      email: email ?? this.email,
      password: password ?? this.password,
      username: username ?? this.username,
    );
  }
}
