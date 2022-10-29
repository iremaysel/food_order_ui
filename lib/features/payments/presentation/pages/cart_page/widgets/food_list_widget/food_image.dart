import 'package:flutter/material.dart';

import '../../../../../../products/presentation/pages/home_page/components/size_config.dart';

class FoodImage extends StatelessWidget {
  final String foodPathImage;
  const FoodImage({Key? key, required this.foodPathImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.blockSizeVertical! * 10,

      /// 80.0
      width: SizeConfig.blockSizeHorizontal! * 25,

      /// 90.0
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(foodPathImage),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(SizeConfig.blockSizeVertical! * 2),
      ),
    );
  }
}
