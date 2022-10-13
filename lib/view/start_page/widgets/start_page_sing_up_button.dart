import 'package:flutter/material.dart';

import '../../home_page/components/colors.dart';
import '../../register_page/register_page_view.dart';
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
