import 'package:flutter/material.dart';

import '../../home_page/components/colors.dart';
import '../../../features/auth/presentation/pages/login_page/login_page_view.dart';
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
