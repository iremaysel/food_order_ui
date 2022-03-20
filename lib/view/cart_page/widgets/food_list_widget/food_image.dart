import 'package:flutter/material.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';

class FoodImage extends StatefulWidget {
  String foodImage;
  FoodImage({required this.foodImage});

  @override
  _FoodImageState createState() => _FoodImageState();
}

class _FoodImageState extends State<FoodImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight!/8.54,                 /// 80.0
      width: SizeConfig.screenWidth!/4.57,                   /// 90.0
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              "${widget.foodImage}"
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }
}
