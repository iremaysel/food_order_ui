import 'package:flutter/material.dart';
import 'package:food_order_ui/view/login_page/widgets/text_field.dart';
import 'widgets/forgot_password.dart';
import 'widgets/login_button.dart';
import 'widgets/logo.dart';
import 'widgets//text_signup.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  _LoginPageViewState createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              LogoImage(),
              LoginTextField(),
              ForgotPassword(),
              LoginButonColor(),
              TextSignUp()
            ],
          ),
        ),
      )
    );
  }
}
