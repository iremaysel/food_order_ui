import 'package:flutter/material.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';

class FoodPart extends StatelessWidget {
  final String partName;
  const FoodPart({Key? key, required this.partName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        SizeConfig.blockSizeHorizontal! * 4,
        SizeConfig.blockSizeVertical! * 0.5,
        SizeConfig.blockSizeHorizontal! * 3,
        SizeConfig.blockSizeVertical! * 0.5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            partName,
            style: TextStyle(
                fontSize: SizeConfig.blockSizeHorizontal! * 5.8,
                fontWeight: FontWeight.w500,
                color: Colors.black87),
          ),

          /// 20.0
          Icon(
            Icons.keyboard_arrow_right,
            color: Colors.black45,
            size: SizeConfig.blockSizeHorizontal! * 6,
          )

          /// 32.0
        ],
      ),
    );
  }
}
