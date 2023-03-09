import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_order_ui/core/error/failure.dart';
import 'package:food_order_ui/features/auth/domain/usecases/login_user_with_email_and_password_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/entities/user.dart';
import '../authetication/authentication_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUserWithEmailAndPasswordUsecase usecase;
  final SharedPreferences sharedPreferences;
  final AuthenticationBloc authenticationBloc;

  LoginBloc(
      {required this.authenticationBloc,
      required this.sharedPreferences,
      required this.usecase})
      : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonEventToState);
  }

  FutureOr<void> _onLoginButtonEventToState(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    final eitherUser =
        await usecase(email: event.email, password: event.password);

    eitherUser.fold(
      (failure) {
        if (failure is UnauthorizedFailure) {
          emit(const LoginError('Error de usuario o contraseña'));
        } else if (failure is BadRequestFailure) {
          emit(const LoginError('Ha Occurido algo en el server'));
        } else {
          emit(const LoginError('Ha Occurido algo en el server'));
        }
      },
      (user) {
        emit(LoginSussess(
            user: user, token: sharedPreferences.getString('token')!));
      },
    );
  }
}
