import 'package:flutter/material.dart';
import 'package:food_order_ui/features/products/presentation/pages/home_page/components/colors.dart';
import 'package:food_order_ui/features/products/presentation/pages/home_page/components/size_config.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal! * 8),

      /// 27.0
      child: Container(
        alignment: Alignment.centerRight,
        child: Text(
          "¿Olvidaste la contraseña?",
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
