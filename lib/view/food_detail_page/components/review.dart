import 'package:flutter/material.dart';
import 'package:food_order_ui/view/home_page/components/colors.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';

class ReviewStars extends StatefulWidget {
  const ReviewStars({Key? key}) : super(key: key);

  @override
  _ReviewStarsState createState() => _ReviewStarsState();
}

class _ReviewStarsState extends State<ReviewStars> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.screenHeight!/45.54),                /// 15.0
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.star_rounded, color: textColor,),
                Text("4.6", style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: SizeConfig.screenHeight!/45.54),),  /// 15.0
                Padding(
                  padding: EdgeInsets.only(left: SizeConfig.screenWidth!/51.38),         /// 8.0
                  child: Text("(52+ Reviews)", style: TextStyle(color: Colors.black26)),
                )
              ],
            ),
            Container(
              height: SizeConfig.screenHeight!/34.15,
              width: SizeConfig.screenWidth!/137,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10)
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: SizeConfig.screenWidth!/51.38),         /// 8.0
                  child: Icon(
                    Icons.delivery_dining_sharp,
                    color: freeDelivery,
                    size: SizeConfig.screenHeight!/22.77,
                  ),
                ),
                Text("FREE DELIVERY", style: TextStyle(color: freeDelivery, fontWeight: FontWeight.bold, fontSize: SizeConfig.screenHeight!/42.69),)  /// 16
              ],
            )
          ],
        )
      ),
    );
  }
}
