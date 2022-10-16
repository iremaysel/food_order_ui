import 'package:flutter/material.dart';
import 'package:food_order_ui/view/home_page/components/colors.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';

class AuthButonColor extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  const AuthButonColor({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        SizeConfig.blockSizeHorizontal! * 5,
        SizeConfig.blocksizeVertical! * 10,
        SizeConfig.blockSizeHorizontal! * 5,
        SizeConfig.blocksizeVertical! * 2,
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
          ],
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: const [0.0, 1.0],
            colors: [
              buttonColor,
              lightColor,
            ],
          ),
          borderRadius:
              BorderRadius.circular(SizeConfig.blockSizeHorizontal! * 8),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(SizeConfig.blockSizeHorizontal! * 8),
              ),
            ),
            minimumSize: MaterialStateProperty.all(Size(
                SizeConfig.blockSizeHorizontal! * 70,
                SizeConfig.blocksizeVertical! * 7.5)),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: SizeConfig.blockSizeHorizontal! * 6,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),

            /// 16
          ),
        ),
      ),
    );
  }
}
