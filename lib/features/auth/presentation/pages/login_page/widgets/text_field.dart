import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/cubit/login_text_fields_helper_cubit.dart';

import 'text_field_widget/text_email_field_input.dart';
import 'text_field_widget/text_field_password.dart';

class LoginTextField extends StatefulWidget {
  const LoginTextField({Key? key}) : super(key: key);

  @override
  _LoginTextFieldState createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
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
            onChange: (value) {
              loginCubit.onEmailChanged(value);
            },
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
            onChange: (value) {
              loginCubit.onPassWordChanded(value);
            },
          ),
        ]);
  }
}
