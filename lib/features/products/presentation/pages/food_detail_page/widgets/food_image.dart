import 'package:flutter/material.dart';
import '../../../../domain/entities/product.dart';
import '../components/arrow_back.dart';
import '../components/favorite_food.dart';
import '../../home_page/components/size_config.dart';

class FoodImage extends StatelessWidget {
  final Product food;
  const FoodImage({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.blockSizeVertical! * 38,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(food.img ?? 'assets/food/ChickenCurryPasta.jpg'),
            fit: BoxFit.cover),
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
