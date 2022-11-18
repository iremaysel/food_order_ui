import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_order_ui/features/auth/domain/entities/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final SharedPreferences sharedPreferences;

  AuthenticationBloc({required this.sharedPreferences})
      : super(AuthenticationUninitialized()) {
    on<AppStarted>(_onAppStartedEventToState);
    on<LoggedIn>(_onLoggedInEventToState);
    on<LoggedOut>(_onLoggedOutEventToState);
  }

  FutureOr<void> _onAppStartedEventToState(
      AppStarted event, Emitter<AuthenticationState> emit) {
    emit(AuthenticationLoading());
    //? aqui se deberia verificar si el token existe en la api para loagar directo al user..

    emit(AuthenticationUnauthenticated());
  }

  FutureOr<void> _onLoggedInEventToState(
      LoggedIn event, Emitter<AuthenticationState> emit) {
    emit(AuthenticationLoading());

    emit(AuthenticationAuthenticated(token: event.token, user: event.user));
  }

  FutureOr<void> _onLoggedOutEventToState(
      LoggedOut event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    await sharedPreferences.remove('jwt');
    emit(AuthenticationUnauthenticated());
  }
}
