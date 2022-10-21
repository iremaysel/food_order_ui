import 'package:flutter/material.dart';
import 'package:food_order_ui/configuration/food.dart';
import 'package:food_order_ui/features/products/presentation/pages/food_detail_page/components/arrow_back.dart';
import 'package:food_order_ui/features/products/presentation/pages/food_detail_page/components/favorite_food.dart';
import 'package:food_order_ui/features/products/presentation/pages/home_page/components/size_config.dart';

class FoodImage extends StatelessWidget {
  final Food food;
  const FoodImage({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.blockSizeVertical! * 38,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(food.foodImageName), fit: BoxFit.cover),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal! * 5,
            vertical: SizeConfig.blockSizeVertical! * 3),

        /// 30.0 - 20.0
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            ArrowBack(),
            FavoriteFood(),
          ],
        ),
      ),
    );
  }
}
