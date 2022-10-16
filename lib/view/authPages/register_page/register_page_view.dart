import 'package:flutter/material.dart';
import 'package:food_order_ui/view/authPages/common/login_button.dart';
import 'package:food_order_ui/view/authPages/register_page/widgets/background_image.dart';
import '../common/text_signup_or_singin.dart';
import '../login_page/login_page_view.dart';
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
