import 'package:flutter/material.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';

class UserSection extends StatelessWidget {
  IconData icon_name;
  String section_text;
  UserSection({required this.icon_name, required this.section_text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          SizeConfig.screenWidth!/13.7,          /// 30.0
          0,
          SizeConfig.screenWidth!/27.4,          /// 15.0
          SizeConfig.screenHeight!/34.15         /// 20.0
      ),
      child: Row(
        children: [
          Icon(icon_name, color: Colors.black54,),
          SizedBox(width: SizeConfig.screenWidth!/41.1,),
          Text(section_text, style: TextStyle(color: Colors.black54, fontSize: SizeConfig.screenHeight!/42.68),),      /// 16
          Spacer(),
          Icon(Icons.keyboard_arrow_right, color: Colors.black45,size: SizeConfig.screenHeight!/21.34,)                /// 32
        ],
      ),
    );
  }
}