import 'package:flutter/material.dart';
import 'package:food_order_ui/configuration/food.dart';
import 'package:food_order_ui/configuration/food_list.dart';
import 'package:food_order_ui/view/cart_page/widgets/food_list_widget/delete_icon_button.dart';
import 'package:food_order_ui/view/cart_page/widgets/food_list_widget/food_text.dart';
import 'package:food_order_ui/view/cart_page/widgets/food_list_widget/food_image.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';
import 'package:lottie/lottie.dart';

class FoodListWidget extends StatefulWidget {
  const FoodListWidget({Key? key}) : super(key: key);

  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodListWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth!/20),
      child: FutureBuilder<List<Food>>(
          future: bringTheFoods(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              var foodList = snapshot.data;
              return ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    var food = foodList![index];
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: SizeConfig.screenHeight!/68.3),          /// 10.0
                      child: Dismissible(
                        key: UniqueKey(),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          setState(() {
                          });
                        },
                        background: Container(
                          padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth!/20.55),    /// 20.0
                          decoration: BoxDecoration(
                            color: Color(0xFFFFE6E6),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              Spacer(),
                              Icon(Icons.delete_outline)
                            ],
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.0),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(4, 6),
                                  blurRadius: 4,
                                  color: Colors.black.withOpacity(0.1),
                                )
                              ]
                          ),
                          child: Row(
                            children: [
                              FoodImage(foodImage: food.foodImageName),
                              SizedBox(width: SizeConfig.screenWidth!/20.55),              /// 20.0
                              FoodText(foodName: food.foodName, foodPrice: food.foodPrice),
                              Spacer(),
                              DeleteIconButton(foodName: food.foodName),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
              );
            }
            else{
              return SizedBox(
                  child: Center(
                    child: Lottie.network("https://assets10.lottiefiles.com/packages/lf20_peztuj79.json",
                        height: SizeConfig.screenHeight!/6.83,      /// 100.0
                        width: SizeConfig.screenWidth!/4.11,        /// 100.0
                        repeat: false),
                  )
              );
            }
          }),
    );
  }
}
