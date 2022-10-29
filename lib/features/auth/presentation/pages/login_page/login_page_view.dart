import 'package:flutter/material.dart';
import 'widgets/text_field.dart';
import '../register_page/register_page_view.dart';
import '../../../../main_components/pages/bottom_navigator.dart';
import 'widgets/forgot_password.dart';
import '../../widgets/login_button.dart';
import 'widgets/logo.dart';
import '../../widgets/text_signup_or_singin.dart';

class LoginPageView extends StatelessWidget {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: LoginPageBody(),
    );
  }
}

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const LogoImage(),
          const LoginTextField(),
          const ForgotPassword(),
          AuthButonColor(
            buttonText: 'Iniciar Sessión',
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MyHomePage()));
            },
          ),
          TextSignUpOrSingIn(
              phrase: "¿No tienes una cuenta? ",
              singInOrSingUpText: 'Registrar',
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterPageView(),
                    ),
                  ))
        ],
      ),
    );
  }
}
