import 'package:flutter/material.dart';
import 'package:food_order_ui/features/auth/presentation/pages/login_page/widgets/text_field.dart';
import 'package:food_order_ui/features/auth/presentation/pages/register_page/register_page_view.dart';
import '../../../../main_components/pages/bottom_navigator.dart';
import 'widgets/forgot_password.dart';
import '../../widgets/login_button.dart';
import 'widgets/logo.dart';
import '../../widgets/text_signup_or_singin.dart';

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              const LogoImage(),
              const LoginTextField(),
              const ForgotPassword(),
              AuthButonColor(
                buttonText: 'Iniciar Sessión',
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyHomePage()));
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
        ));
  }
}
