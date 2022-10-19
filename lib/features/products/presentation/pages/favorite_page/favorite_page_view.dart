import 'package:flutter/material.dart';
import 'package:food_order_ui/configuration/food.dart';
import 'package:food_order_ui/configuration/food_list.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';
import 'package:food_order_ui/view/home_page/widgets/popular.dart';

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
          "My Favorite",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth! / 20.0,
            vertical: SizeConfig.screenHeight! / 136.6),

        /// 20.0 - 5.0
        child: FutureBuilder<List<Food>>(
            future: bringTheFoods(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var foodList = snapshot.data;
                return GridView.builder(
                    itemCount: 3,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      //  childAspectRatio: 3.2 / 4,
                    ),
                    itemBuilder: (context, index) {
                      var food = foodList![index];
                      return Container(

                          /// 220.0

                          /// 200.0
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.0),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 3),
                                  blurRadius: 6,
                                  color: Colors.black.withOpacity(0.1),
                                )
                              ]),
                          child: const PopularFoods());
                    });
              } else {
                return Padding(
                  padding:
                      EdgeInsets.only(top: SizeConfig.screenHeight! / 3.10),

                  /// 200.0
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

                      /// 20.0
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }
}
