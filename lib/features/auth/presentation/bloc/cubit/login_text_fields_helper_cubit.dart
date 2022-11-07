import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_text_fields_helper_state.dart';

class LoginTextFieldsHelperCubit extends Cubit<LoginTextFieldsHelperState> {
  LoginTextFieldsHelperCubit()
      : super(const LoginTextFieldsHelperState(
            email: '', password: '', username: ''));

  void onEmailChanged(String email) {
    emit(state.copyWith(email: email));
  }

  void onPassWordChanded(String password) {
    emit(state.copyWith(password: password));
  }

  void onUsernameChanded(String username) {
    emit(state.copyWith(username: username));
  }
}
