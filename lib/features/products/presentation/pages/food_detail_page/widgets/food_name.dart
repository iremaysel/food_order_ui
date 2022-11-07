import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/shared/entities/product.dart';
import '../../home_page/components/size_config.dart';

class FoodName extends StatelessWidget {
  final Product food;
  const FoodName({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: SizeConfig.blockSizeHorizontal! * 72,
              child: Text(
                food.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: SizeConfig.blockSizeHorizontal! * 8,
                    fontFamily: "Roboto"),
              ),
            ),
            // Text(food.categories,
            //     style: TextStyle(
            //       color: Colors.black45,
            //       fontSize: SizeConfig.blockSizeHorizontal! * 5,
            //     )),
          ],
        ),
        const Spacer(),
        SizedBox(
          width: SizeConfig.blockSizeHorizontal! * 16,
          child: AutoSizeText(
            maxLines: 1,
            "\$${food.price}",
            style: TextStyle(
              color: Colors.black87,
              fontSize: SizeConfig.blockSizeHorizontal! * 7,
            ),
          ),
        ),

        /// 30
      ],
    );
  }
}
