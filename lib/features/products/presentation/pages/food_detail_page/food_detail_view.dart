import 'package:flutter/material.dart';
import 'package:food_order_ui/configuration/food.dart';
import 'package:food_order_ui/features/products/presentation/pages/food_detail_page/widgets/detail_widget.dart';
import 'package:food_order_ui/features/products/presentation/pages/food_detail_page/widgets/food_image.dart';
import 'package:food_order_ui/features/products/presentation/pages/home_page/components/size_config.dart';

class FoodDetailView extends StatelessWidget {
  final Food food;
  const FoodDetailView({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              FoodImage(food: food),
              DetailWidget(
                food: food,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
