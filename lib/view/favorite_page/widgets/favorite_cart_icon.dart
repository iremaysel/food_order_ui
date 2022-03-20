import 'package:flutter/material.dart';
import 'package:food_order_ui/view/home_page/components/colors.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';

class FavoriteCartIcon extends StatefulWidget {
  const FavoriteCartIcon({Key? key}) : super(key: key);

  @override
  _FavoriteCartIconState createState() => _FavoriteCartIconState();
}

class _FavoriteCartIconState extends State<FavoriteCartIcon> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Container(
        height: SizeConfig.screenHeight!/13.66,                      /// 50.0
        width: SizeConfig.screenWidth!/8.22,                         /// 50.0
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30.0),
                topLeft: Radius.circular(30.0),
            ),
        ),
        child: Icon(
          Icons.shopping_cart_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
