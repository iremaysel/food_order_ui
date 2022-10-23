import 'package:flutter/material.dart';
import 'package:food_order_ui/core/configuration/food.dart';
import 'package:food_order_ui/core/configuration/food_list.dart';
import 'package:food_order_ui/features/products/presentation/pages/home_page/components/size_config.dart';

import '../../../widgets/custom_food_card.dart';

class PopularFoods extends StatelessWidget {
  const PopularFoods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Food>>(
      future: bringTheFoods(),
      builder: (context, AsyncSnapshot<List<Food>> snapshot) {
        if (snapshot.hasData) {
          var foodList = snapshot.data;
          return SizedBox(
            height: SizeConfig.blockSizeVertical! * 45,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodList!.length,
              itemBuilder: (context, index) {
                var food = foodList[index];
                return CustomFoodCard(food: food);
              },
            ),
          );
        } else {
          return const Center();
        }
      },
    );
  }
}
