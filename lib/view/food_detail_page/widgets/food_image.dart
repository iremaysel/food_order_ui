import 'package:flutter/material.dart';
import 'package:food_order_ui/configuration/food.dart';
import 'package:food_order_ui/view/food_detail_page/components/arrow_back.dart';
import 'package:food_order_ui/view/food_detail_page/components/favorite_food.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';

class FoodImage extends StatefulWidget {
  Food food;
  FoodImage({required this.food});

  @override
  _FoodImageState createState() => _FoodImageState();
}

class _FoodImageState extends State<FoodImage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.screenHeight! * 0.45,
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        image: DecorationImage(
            image: AssetImage("${widget.food.foodImageName}"),
            fit: BoxFit.fitWidth
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth!/13.7, vertical: SizeConfig.screenHeight!/34.15),     /// 30.0 - 20.0
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ArrowBack(),
              FavoriteFood(),
            ],
          ),
        ),
      ),
    );
  }
}
