import 'package:flutter/material.dart';

import '../../auth/presentation/pages/login_page/login_page_view.dart';
import '../../products/presentation/pages/home_page/components/colors.dart';
import 'login_button_widget.dart';

class StartPageBodyLoginButton extends StatelessWidget {
  const StartPageBodyLoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginButton(
        textButton: 'Login',
        colorButton: lightColor,
        colorTextButton: Colors.white,
        onPressed: () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginPageView())));
  }
}
