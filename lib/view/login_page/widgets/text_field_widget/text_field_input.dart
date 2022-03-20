import 'package:flutter/material.dart';
import 'package:food_order_ui/view/home_page/components/colors.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';

class TextFieldInput extends StatelessWidget {
  String text;
  IconData iconName;
  String ltext;
  TextFieldInput({required this.text, required this.iconName, required this.ltext});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            SizeConfig.screenWidth!/20.55,
            SizeConfig.screenHeight!/68.3,
            SizeConfig.screenWidth!/20.55,
            SizeConfig.screenHeight!/34.15
        ),
        child: TextField(
          style: TextStyle(color: textColor),
          cursorColor: textColor,
          decoration: InputDecoration(
              prefixIcon: Icon(iconName),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(width: SizeConfig.screenWidth!/205.5, color: textColor),  /// 2
              ),
              enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(width: 1,color: texthint),
              ) ,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              hintText: text,
              hintStyle: TextStyle(color: texthint.withOpacity(0.3)),
              labelText: ltext,
              labelStyle: TextStyle(color: texthint.withOpacity(0.6))
          ),
        ),
      ),
    );
  }
}