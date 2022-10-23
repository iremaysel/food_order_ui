import 'package:flutter/material.dart';
import 'package:food_order_ui/features/products/presentation/pages/home_page/components/size_config.dart';

import '../../../../../../core/configuration/food.dart';

class FoodDescription extends StatelessWidget {
  final Food food;
  const FoodDescription({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical! * 2),

      /// 15.0
      child: const Text(
        //TODO: Add food Description in food Entity ..

        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud eslednjn",
        style: TextStyle(color: Colors.black38),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
