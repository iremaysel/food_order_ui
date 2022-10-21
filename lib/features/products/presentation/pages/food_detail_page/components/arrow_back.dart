import 'package:flutter/material.dart';
import 'package:food_order_ui/features/products/presentation/pages/home_page/components/size_config.dart';

class ArrowBack extends StatelessWidget {
  const ArrowBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
        height: SizeConfig.blockSizeVertical! * 5,
        width: SizeConfig.blockSizeHorizontal! * 10.28,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.55),
          borderRadius:
              BorderRadius.circular(SizeConfig.blockSizeHorizontal! * 2.2),
        ),
        alignment: Alignment.center,
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ));
  }
}
