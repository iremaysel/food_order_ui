import 'package:flutter/material.dart';

import '../../login_page/widgets/text_field_widget/text_email_field_input.dart';
import '../../login_page/widgets/text_field_widget/text_field_password.dart';

class RegisterTextField extends StatefulWidget {
  const RegisterTextField({Key? key}) : super(key: key);

  @override
  _RegisterTextFieldState createState() => _RegisterTextFieldState();
}

class _RegisterTextFieldState extends State<RegisterTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          TextFieldInput(
              text: "nombre de usuario",
              iconName: Icons.account_circle,
              ltext: "Nombre de usuario"),
          TextFieldInput(
            text: "email",
            iconName: Icons.mail,
            ltext: "Email",
          ),
          TextFieldPassword(hintText: 'contraseña', labelText: 'Contraseña'),
          TextFieldPassword(
              hintText: 'repetir contraseña', labelText: 'Repetir Contraseña'),
        ]);
  }
}
