import 'package:flutter/material.dart';
import 'package:food_order_ui/view/home_page/components/colors.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';

class TextFieldInput extends StatelessWidget {
  final String text;
  final IconData iconName;
  final String ltext;
  const TextFieldInput(
      {Key? key,
      required this.text,
      required this.iconName,
      required this.ltext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          SizeConfig.blockSizeHorizontal! * 5,
          SizeConfig.blocksizeVertical! * 2,
          SizeConfig.blockSizeHorizontal! * 5,
          SizeConfig.blocksizeVertical! * 2,
        ),
        child: TextField(
          //TODO: Hacer para Procesar los datos...

          style: TextStyle(color: textColor),
          cursorColor: textColor,
          decoration: InputDecoration(
              prefixIcon: Icon(iconName),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(SizeConfig.blockSizeHorizontal! * 5)),
                borderSide: BorderSide(
                    width: SizeConfig.blockSizeHorizontal! * 0.30,
                    color: textColor),

                /// 2
              ),
              enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(SizeConfig.blockSizeHorizontal! * 1.5)),
                borderSide: BorderSide(width: 1, color: texthint),
              ),
              border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(SizeConfig.blockSizeHorizontal! * 5),
              ),
              hintText: text,
              hintStyle: TextStyle(color: texthint.withOpacity(0.3)),
              labelText: ltext,
              labelStyle: TextStyle(color: texthint.withOpacity(0.6))),
        ),
      ),
    );
  }
}
