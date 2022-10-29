import 'package:flutter/material.dart';
import '../../widgets/food_part.dart';
import 'widgets/categories.dart';
import 'widgets/discount_cart.dart';
import 'widgets/popular.dart';
import 'widgets/recommed.dart';
import 'widgets/search_food.dart';
import 'widgets/username_text.dart';
import 'components/size_config.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: const [
            UserNameText(username: 'Roger'),
            SearchFood(),
            DiscountCard(),
            FoodPart(partName: "Categorias"),
            CategoriesFood(),
            FoodPart(partName: "Recomendados"),
            RecommedFoods(),
            FoodPart(partName: "Popular"),
            PopularFoods(),
            //Done..
          ],
        ),
      ),
    );
  }
}
