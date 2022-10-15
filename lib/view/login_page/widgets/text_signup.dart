import 'package:flutter/material.dart';
import 'package:food_order_ui/view/home_page/components/colors.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';
import 'package:food_order_ui/view/register_page/register_page_view.dart';

class TextSignUp extends StatelessWidget {
  const TextSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        SizeConfig.blockSizeHorizontal! * 5,
        SizeConfig.blocksizeVertical! * 1,
        SizeConfig.blockSizeHorizontal! * 5,
        0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "No tienes una cuenta?",
            style: TextStyle(color: texthint),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterPageView()));
            },
            child: Text(
              " Registrar",
              style: TextStyle(
                  color: buttonColor,
                  fontWeight: FontWeight.w600,
                  fontSize: SizeConfig.blockSizeHorizontal! * 5

                  /// 15
                  ),
            ),
          )
        ],
      ),
    );
  }
}
