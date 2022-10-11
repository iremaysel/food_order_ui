import 'package:flutter/material.dart';
import 'package:food_order_ui/view/home_page/components/food_part.dart';
import 'package:food_order_ui/view/home_page/widgets/categories.dart';
import 'package:food_order_ui/view/home_page/widgets/discount_cart.dart';
import 'package:food_order_ui/view/home_page/widgets/popular.dart';
import 'package:food_order_ui/view/home_page/widgets/recommed.dart';
import 'package:food_order_ui/view/home_page/widgets/search_food.dart';
import 'package:food_order_ui/view/home_page/widgets/username_text.dart';
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
          children: [
            const UserNameText(),
            const SearchFood(),
            const DiscountCard(),
            FoodPart(partName: "Categories"),
            const CategoriesFood(),
            FoodPart(partName: "Recommed"),
            const RecommedFoods(),
            FoodPart(partName: "Popular"),
            const PopularFoods(),
          ],
        ),
      ),
    );
  }
}
