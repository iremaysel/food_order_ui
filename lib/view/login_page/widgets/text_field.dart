import 'package:flutter/material.dart';
import 'package:food_order_ui/view/login_page/widgets/text_field_widget/text_field_input.dart';
import 'package:food_order_ui/view/login_page/widgets/text_field_widget/text_field_password.dart';

class LoginTextField extends StatefulWidget {
  const LoginTextField({Key? key}) : super(key: key);

  @override
  _LoginTextFieldState createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFieldInput(text: "email", iconName: Icons.mail, ltext: "Email",),
            TextFieldPassword(),
          ]
        )
    );
  }
}
