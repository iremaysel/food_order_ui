import 'package:flutter/material.dart';
import 'package:food_order_ui/configuration/food.dart';
import 'package:food_order_ui/view/food_detail_page/widgets/addtocart_button.dart';
import 'package:food_order_ui/view/food_detail_page/components/features_food.dart';
import 'package:food_order_ui/view/food_detail_page/components/review.dart';
import 'package:food_order_ui/view/food_detail_page/widgets/food_description.dart';
import 'package:food_order_ui/view/food_detail_page/widgets/increase_decrease_button.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';
import 'food_name.dart';

class DetailWidget extends StatefulWidget {
  Food food;
  DetailWidget({required this.food});

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.screenHeight! * 0.35),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0)
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 10,
            offset: Offset(0,-1)
          )
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Container(
              width: SizeConfig.screenWidth!/3.43,        /// 120.0
              height: SizeConfig.screenHeight!/227.67,    /// 3.0
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black12
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight!/34.15,),      /// 20.0
            FoodName(food: widget.food),
            ReviewStars(),
            FoodDescription(),
            FeaturesFood(),
            IncreaseDecrease(food: widget.food),
            AddToCartButton(),
          ],
        ),
      ),
    );
  }
}
