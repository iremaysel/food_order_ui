import 'package:flutter/material.dart';
import 'package:food_order_ui/configuration/food.dart';
import 'package:food_order_ui/features/products/presentation/pages/food_detail_page/widgets/addtocart_button.dart';
import 'package:food_order_ui/features/products/presentation/pages/food_detail_page/components/review.dart';
import 'package:food_order_ui/features/products/presentation/pages/food_detail_page/widgets/food_description.dart';
import 'package:food_order_ui/features/products/presentation/pages/food_detail_page/widgets/increase_decrease_button.dart';
import 'package:food_order_ui/features/products/presentation/pages/home_page/components/size_config.dart';
import 'food_name.dart';

class DetailWidget extends StatelessWidget {
  final Food food;
  const DetailWidget({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical! * 35),
      height: SizeConfig.blockSizeVertical! * 65,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(SizeConfig.blockSizeHorizontal! * 6),
              topRight: Radius.circular(SizeConfig.blockSizeHorizontal! * 6)),
          boxShadow: const [
            BoxShadow(
                color: Colors.black54, blurRadius: 10, offset: Offset(0, -1))
          ]),
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 6),
        child: Column(
          children: [
            FoodName(food: food),
            ReviewStars(food: food),
            FoodDescription(food: food),
            IncreaseDecrease(food: food),
            const AddToCartButton(),
          ],
        ),
      ),
    );
  }
}
