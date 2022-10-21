import 'package:flutter/material.dart';
import 'package:food_order_ui/features/products/presentation/pages/home_page/components/colors.dart';
import 'package:food_order_ui/features/products/presentation/pages/home_page/components/size_config.dart';

import '../../../../../../configuration/food.dart';

class ReviewStars extends StatelessWidget {
  final Food food;
  const ReviewStars({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical! * 1),

      /// 15.0
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.star_rounded,
                color: textColor,
              ),
              Text(
                //TODO: ADD Rating to a Food Entity.
                "4.6",
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.blockSizeHorizontal! * 4.5),
              ),

              /// 15.0
              Padding(
                padding:
                    EdgeInsets.only(left: SizeConfig.blockSizeHorizontal! * 2),

                /// 8.0
                child: const Text("(52+ Reviews)",
                    style: TextStyle(color: Colors.black26)),
              )
            ],
          ),
          Container(
            height: SizeConfig.blockSizeVertical! * 3,
            width: SizeConfig.blockSizeHorizontal! * .5,
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius:
                    BorderRadius.circular(SizeConfig.blockSizeHorizontal! * 5)),
          ),
          Row(
            children: [
              Icon(
                Icons.delivery_dining_sharp,
                color: freeDelivery,
                size: SizeConfig.blockSizeVertical! * 4,
              ),
              Text(
                "ENTREGA GRATIS.",
                style: TextStyle(
                    color: freeDelivery,
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.blockSizeVertical! * 2),
              )
            ],
          )
        ],
      ),
    );
  }
}
