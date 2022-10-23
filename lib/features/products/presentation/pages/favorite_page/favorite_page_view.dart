import 'package:flutter/material.dart';
import 'package:food_order_ui/core/configuration/food.dart';
import 'package:food_order_ui/core/configuration/food_list.dart';
import 'package:food_order_ui/features/products/presentation/pages/home_page/components/size_config.dart';
import 'package:food_order_ui/features/products/presentation/widgets/custom_food_card.dart';

class FavoritePageView extends StatefulWidget {
  const FavoritePageView({Key? key}) : super(key: key);

  @override
  _FavoritePageViewState createState() => _FavoritePageViewState();
}

class _FavoritePageViewState extends State<FavoritePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Favoritos",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal! * 1,
            vertical: SizeConfig.blockSizeVertical! * 1),

        /// 20.0 - 5.0
        child: FutureBuilder<List<Food>>(
            future: bringTheFoods(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var foodList = snapshot.data;
                return GridView.builder(
                    itemCount: foodList!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 3,
                    ),
                    itemBuilder: (context, index) {
                      var food = foodList[index];
                      return CustomFoodCard(food: food);
                    });
              } else {
                return Padding(
                  padding:
                      EdgeInsets.only(top: SizeConfig.screenHeight! / 3.10),
                  child: Column(
                    children: [
                      Center(
                          child: Icon(
                        Icons.favorite,
                        color: Colors.black12,
                        size: SizeConfig.screenHeight! / 11.39,
                      )),

                      /// 60.0
                      SizedBox(
                        height: SizeConfig.screenHeight! / 34.15,
                      ),

                      /// 20.0
                      Center(
                          child: Text(
                        "Your Favorite Foods",
                        style: TextStyle(
                            color: Colors.black12,
                            fontSize: SizeConfig.screenHeight! / 34.15),
                      ))
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }
}
