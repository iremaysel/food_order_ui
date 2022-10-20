import 'package:flutter/material.dart';

import '../../products/presentation/pages/home_page/components/colors.dart';
import '../../auth/presentation/pages/register_page/register_page_view.dart';
import 'login_button_widget.dart';

class StartPageBodySingUpButton extends StatelessWidget {
  const StartPageBodySingUpButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginButton(
        textButton: 'Sing Up',
        colorButton: registerColor,
        colorTextButton: buttonColor,
        onPressed: () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const RegisterPageView())));
  }
}
