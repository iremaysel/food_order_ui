import 'package:flutter/material.dart';
import 'package:food_order_ui/core/util/food.dart';
import 'package:food_order_ui/core/util/food_list.dart';
import 'package:food_order_ui/features/payments/presentation/pages/cart_page/widgets/food_list_widget/delete_icon_button.dart';
import 'package:food_order_ui/features/payments/presentation/pages/cart_page/widgets/food_list_widget/food_text.dart';
import 'package:food_order_ui/features/payments/presentation/pages/cart_page/widgets/food_list_widget/food_image.dart';
import 'package:food_order_ui/features/products/presentation/pages/home_page/components/size_config.dart';
import 'package:lottie/lottie.dart';

class FoodCartListWidget extends StatelessWidget {
  const FoodCartListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal! * 5),
      child: FutureBuilder<List<Food>>(
          future: bringTheFoods(),
          builder: (context, AsyncSnapshot<List<Food>> snapshot) {
            if (snapshot.hasData) {
              var foodList = snapshot.data;
              return ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, int index) {
                    var food = foodList![index];
                    return HorizontalCartCardFood(food: food);
                  });
            } else {
              return SizedBox(
                  child: Center(
                child: Lottie.network(
                    "https://assets10.lottiefiles.com/packages/lf20_peztuj79.json",
                    height: SizeConfig.screenHeight! / 6.83,

                    /// 100.0
                    width: SizeConfig.screenWidth! / 4.11,

                    /// 100.0
                    repeat: false),
              ));
            }
          }),
    );
  }
}

class HorizontalCartCardFood extends StatelessWidget {
  const HorizontalCartCardFood({
    Key? key,
    required this.food,
  }) : super(key: key);

  final Food food;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical! * 1),

      /// 10.0
      child: Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {},
        background: Container(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal! * 2),

          /// 20.0
          decoration: BoxDecoration(
            color: const Color(0xFFFFE6E6),
            borderRadius:
                BorderRadius.circular(SizeConfig.blockSizeVertical! * 3),
          ),
          child: Row(
            children: const [Spacer(), Icon(Icons.delete_outline)],
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(SizeConfig.blockSizeVertical! * 3),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(4, 6),
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.1),
                )
              ]),
          child: Row(
            children: [
              FoodImage(foodPathImage: food.foodImageName),
              SizedBox(width: SizeConfig.blockSizeHorizontal! * 3),
              FoodTextBody(
                foodName: food.foodName,
                foodPrice: food.foodPrice,
                cantity: '1',
              ),
              const Spacer(),
              DeleteIconButton(foodName: food.foodName),
            ],
          ),
        ),
      ),
    );
  }
}
