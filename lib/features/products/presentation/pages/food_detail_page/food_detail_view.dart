import 'package:flutter/material.dart';
import '../../../domain/entities/product.dart';
import 'widgets/detail_widget.dart';
import 'widgets/food_image.dart';
import '../home_page/components/size_config.dart';

class FoodDetailView extends StatelessWidget {
  final Product food;
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
              FoodImage(product: food),
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
