import 'package:flutter/material.dart';
import 'package:food_order_ui/features/products/presentation/pages/home_page/components/size_config.dart';

class LoginButton extends StatelessWidget {
  final String textButton;
  final Color colorButton;
  final Color colorTextButton;
  final VoidCallback onPressed;

  const LoginButton({
    Key? key,
    required this.textButton,
    required this.colorButton,
    required this.colorTextButton,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        SizeConfig.blockSizeHorizontal! * 2,
        0,
        SizeConfig.blockSizeHorizontal! * 2,
        SizeConfig.blockSizeVertical! * 2,
      ),
      child: Container(
        decoration: BoxDecoration(
          //boxShadow: [BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)],
          color: colorButton,
          borderRadius:
              BorderRadius.circular(SizeConfig.blockSizeHorizontal! * 10),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(SizeConfig.blockSizeHorizontal! * 10),
              ),
            ),
            minimumSize: MaterialStateProperty.all(Size(
                SizeConfig.blockSizeHorizontal! * 75,
                SizeConfig.blockSizeVertical! * 7)),
            backgroundColor: MaterialStateProperty.all(colorButton),
            // shadowColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: onPressed,
          child: Text(
            textButton.toUpperCase(),
            style: TextStyle(
              fontSize: SizeConfig.blockSizeHorizontal! * 5,
              fontWeight: FontWeight.w700,
              color: colorTextButton,
            ),
          ),
        ),
      ),
    );
  }
}
