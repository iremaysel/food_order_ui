import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/cubit/login_text_fields_helper_cubit.dart';
import '../../login_page/widgets/text_field_widget/text_email_field_input.dart';
import '../../login_page/widgets/text_field_widget/text_field_password.dart';

class RegisterTextField extends StatelessWidget {
  const RegisterTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginTextFieldsHelperCubit>(context);
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFieldInput(
              onValidator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onChange: (value) => loginCubit.onUsernameChanded(value),
              text: "nombre de usuario",
              iconName: Icons.account_circle,
              ltext: "Nombre de usuario"),
          TextFieldInput(
            onValidator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onChange: (value) => loginCubit.onEmailChanged(value),
            text: "email",
            iconName: Icons.mail,
            ltext: "Email",
          ),
          TextFieldPassword(
            onValidator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            hintText: 'contraseña',
            labelText: 'Contraseña',
            onChange: (value) => loginCubit.onPassWordChanded(value),
          ),
        ]);
  }
}
