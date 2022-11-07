import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/entities/user.dart';
import '../../../domain/usecases/register_user_with_email_and_password_usecase.dart';
import '../authetication/authentication_bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUserWithEmailAndPasswordUsecase usecase;
  final SharedPreferences sharedPreferences;
  final AuthenticationBloc authenticationBloc;
  RegisterBloc({
    required this.usecase,
    required this.sharedPreferences,
    required this.authenticationBloc,
  }) : super(RegisterInitial()) {
    on<RegisterButtonPressed>(_onRegisterButtonPressedToState);
  }

  FutureOr<void> _onRegisterButtonPressedToState(
      RegisterButtonPressed event, Emitter<RegisterState> emit) async {
    emit(RegisterLoading());
    try {
      final eitherUser = await usecase(
          email: event.email,
          password: event.password,
          fullName: event.fullname);

      eitherUser.fold(
        (failure) => emit(RegisterError()),
        (user) {
          emit(RegisterSussess(
              user: user, token: sharedPreferences.getString('token')!));
        },
      );
    } catch (e) {
      emit(RegisterError());
    }
  }
}
