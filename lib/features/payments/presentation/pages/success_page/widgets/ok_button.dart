import 'package:flutter/material.dart';
import 'package:food_order_ui/view/bottom_navigator.dart';
import 'package:food_order_ui/view/home_page/components/colors.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';

class OkButton extends StatefulWidget {
  const OkButton({Key? key}) : super(key: key);

  @override
  _OkButtonState createState() => _OkButtonState();
}

class _OkButtonState extends State<OkButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MyHomePage()));
      },
      child: Container(
          width: SizeConfig.screenWidth!/2 ,        /// 200
          height: SizeConfig.screenHeight!/12.42,   /// 55
          decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(30)
          ),
          child: Center(child: Text("OK", style: TextStyle(color: Colors.white, fontSize: SizeConfig.screenHeight!/37.95),)) /// 18
      ),
    );
  }
}
