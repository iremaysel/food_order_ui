import 'package:flutter/material.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';

class TextTitle extends StatelessWidget {
  String title;
  TextTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(title, style: TextStyle(color: Colors.white, fontSize: SizeConfig.screenHeight!/22.77, fontWeight: FontWeight.bold),),   /// 30
      alignment: Alignment.center,
    );
  }
}
