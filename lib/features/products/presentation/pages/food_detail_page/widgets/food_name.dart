import 'package:flutter/material.dart';
import 'package:food_order_ui/configuration/food.dart';
import 'package:food_order_ui/features/products/presentation/pages/home_page/components/size_config.dart';

class FoodName extends StatelessWidget {
  final Food food;
  const FoodName({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: SizeConfig.blockSizeHorizontal! * 72,
              child: Text(
                food.foodName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: SizeConfig.blockSizeHorizontal! * 8,
                    fontFamily: "Roboto"),
              ),
            ),
            Text(food.foodCategory,
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: SizeConfig.blockSizeHorizontal! * 5,
                )),
          ],
        ),
        const Spacer(),
        Text(
          "\$${food.foodPrice}",
          style: TextStyle(
            color: Colors.black87,
            fontSize: SizeConfig.blockSizeHorizontal! * 7,
          ),
        ),

        /// 30
      ],
    );
  }
}
