import 'package:flutter/material.dart';
import '../../../../domain/entities/product.dart';
import 'addtocart_button.dart';
import '../components/review.dart';
import 'food_description.dart';
import 'increase_decrease_button.dart';
import '../../home_page/components/size_config.dart';
import 'food_name.dart';

class DetailWidget extends StatelessWidget {
  final Product food;
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
            ReviewStars(product: food),
            FoodDescription(product: food),
            IncreaseDecrease(product: food),
            const AddToCartButton(),
          ],
        ),
      ),
    );
  }
}
