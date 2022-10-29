import 'package:flutter/material.dart';

import '../../domain/entities/product.dart';
import '../pages/food_detail_page/food_detail_view.dart';
import '../pages/home_page/components/colors.dart';
import '../pages/home_page/components/size_config.dart';

class CustomFoodCard extends StatelessWidget {
  const CustomFoodCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FoodDetailView(food: product)));
      },
      child: Stack(
        fit: StackFit.loose,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal! * 3,
              vertical: SizeConfig.blockSizeVertical! * 1,
            ),
            height: SizeConfig.blockSizeVertical! * 30.5,
            width: SizeConfig.blockSizeHorizontal! * 38,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(SizeConfig.blockSizeHorizontal! * 4),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 3),
                    blurRadius: 6,
                    color: Colors.black.withOpacity(0.3),
                  )
                ]),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: SizeConfig.blockSizeVertical! * 13,

                      /// 100.0
                      width: SizeConfig.blockSizeHorizontal! * 38,

                      /// 150.0
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image:
                              NetworkImage('assets/food/ChickenCurryPasta.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                                SizeConfig.blockSizeHorizontal! * 4),
                            topRight: Radius.circular(
                                SizeConfig.blockSizeHorizontal! * 4)),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 2),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: SizeConfig.blockSizeVertical! * 2.6,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              product.categories,
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: SizeConfig.blockSizeVertical! * 2,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: SizeConfig.blockSizeVertical! * 1,
                  left: SizeConfig.blockSizeHorizontal! * 2.5,
                  child: Text(
                    "\$${product.price}",
                    style: TextStyle(
                        color: buttonColor,
                        fontSize: SizeConfig.blockSizeVertical! * 2.3,

                        /// 18
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: SizeConfig.blockSizeVertical! * 6,
                    width: SizeConfig.blockSizeHorizontal! * 12,
                    decoration: BoxDecoration(
                        color: buttonColor,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(
                              SizeConfig.blockSizeHorizontal! * 4),
                          topLeft: Radius.circular(
                              SizeConfig.blockSizeHorizontal! * 6),
                        )),
                    child: const Icon(
                      Icons.shopping_cart_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
