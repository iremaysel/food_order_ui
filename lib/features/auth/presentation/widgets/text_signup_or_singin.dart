import 'package:flutter/material.dart';
import '../../../products/presentation/pages/home_page/components/colors.dart';
import '../../../products/presentation/pages/home_page/components/size_config.dart';

class TextSignUpOrSingIn extends StatelessWidget {
  final String phrase;
  final String singInOrSingUpText;
  final VoidCallback onPressed;
  const TextSignUpOrSingIn({
    Key? key,
    required this.phrase,
    required this.singInOrSingUpText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        SizeConfig.blockSizeHorizontal! * 5,
        SizeConfig.blockSizeVertical! * 1,
        SizeConfig.blockSizeHorizontal! * 5,
        0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            phrase,
            style: TextStyle(color: texthint),
          ),
          GestureDetector(
            onTap: onPressed,
            child: Text(
              singInOrSingUpText,
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
