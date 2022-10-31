import 'package:flutter/material.dart';

import '../../widgets/login_button.dart';
import '../../widgets/text_signup_or_singin.dart';
import '../login_page/login_page_view.dart';
import 'widgets/background_image.dart';
import 'widgets/text_field.dart';

class RegisterPageView extends StatelessWidget {
  const RegisterPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const BackgroundImage(),
              const RegisterTextField(),
              AuthButonColor(
                  buttonText: 'Crear Cuenta',
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPageView()))),
              TextSignUpOrSingIn(
                phrase: 'Ya tines una cuenta! ',
                singInOrSingUpText: 'Iniciar Sessión',
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginPageView())),
              )
            ],
          ),
        ));
  }
}
