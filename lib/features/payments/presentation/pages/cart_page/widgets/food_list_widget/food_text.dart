import 'package:flutter/material.dart';

import '../../../../../../products/presentation/pages/home_page/components/colors.dart';
import '../../../../../../products/presentation/pages/home_page/components/size_config.dart';

class FoodTextBody extends StatelessWidget {
  final String foodName;
  final String foodPrice;
  final int cantity;
  const FoodTextBody(
      {Key? key,
      required this.foodName,
      required this.foodPrice,
      required this.cantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: SizeConfig.blockSizeHorizontal! * 48,
          color: Colors.white,
          child: Text(
            foodName,
            style: TextStyle(
                color: Colors.black,
                fontSize: SizeConfig.blockSizeVertical! * 2.2),

            /// 16
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(height: SizeConfig.blockSizeVertical! * 0.6),

        /// 2.0
        Text.rich(
          TextSpan(
            text: "\$$foodPrice",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: buttonColor,
                fontSize: SizeConfig.blockSizeVertical! * 2.3

                /// 18
                ),
            children: [
              TextSpan(
                  text: " x $cantity",
                  style: Theme.of(context).textTheme.bodyText1),
            ],
          ),
        ),
      ],
    );
  }
}
