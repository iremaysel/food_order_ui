import 'package:flutter/material.dart';

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
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          TextFieldInput(
            text: "email",
            iconName: Icons.mail,
            ltext: "Email",
          ),
          TextFieldPassword(hintText: 'contraseña', labelText: 'Contraseña'),
        ]);
  }
}
