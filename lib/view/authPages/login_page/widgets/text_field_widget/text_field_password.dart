import 'package:flutter/material.dart';
import 'package:food_order_ui/view/home_page/components/colors.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';

class TextFieldPassword extends StatefulWidget {
  const TextFieldPassword({Key? key}) : super(key: key);

  @override
  _TextFieldPasswordState createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<TextFieldPassword> {
  bool passwordObscure = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          SizeConfig.blockSizeHorizontal! + 20,
          SizeConfig.blocksizeVertical! + 10,
          SizeConfig.blockSizeHorizontal! + 20,
          SizeConfig.blocksizeVertical! + 10,
        ),
        child: TextField(
          obscureText: passwordObscure,
          style: TextStyle(color: textColor),
          cursorColor: textColor,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.vpn_key),
              suffixIcon: IconButton(
                onPressed: () => setState(() {
                  passwordObscure = !passwordObscure;
                }),
                icon: Icon(
                    passwordObscure ? Icons.visibility_off : Icons.visibility),
              ),
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
              hintText: "contraseña",
              hintStyle: TextStyle(color: texthint.withOpacity(0.3)),
              labelText: "Contraseña",
              labelStyle: TextStyle(color: texthint.withOpacity(0.6))),
        ),
      ),
    );
  }
}
