import 'package:flutter/material.dart';
import '../../home_page/components/size_config.dart';

import '../../../../domain/entities/product.dart';

class FoodDescription extends StatelessWidget {
  final Product product;
  const FoodDescription({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical! * 2),

      /// 15.0
      child: const Text(
        //TODO: Add food Description in food Entity ..

        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud eslednjn",
        style: TextStyle(color: Colors.black38),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
