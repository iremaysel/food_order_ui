import 'package:flutter/material.dart';
import 'package:food_order_ui/view/home_page/components/colors.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';

class FavoriteDetail extends StatefulWidget {
  String food_image_name;
  String food_name;
  String food_category;
  String food_price;

  FavoriteDetail({
    required this.food_image_name,
    required this.food_name,
    required this.food_category,
    required this.food_price});

  @override
  _FavoriteDetailState createState() => _FavoriteDetailState();
}

class _FavoriteDetailState extends State<FavoriteDetail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: SizeConfig.screenHeight!/6.21,           /// 110.0
          width: SizeConfig.screenWidth!/2.055,            /// 200.0
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  "${widget.food_image_name}"),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.food_name}",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: SizeConfig.screenHeight!/34.15,          /// 20.0
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "${widget.food_category}",
                style: TextStyle(
                    color: Colors.black38,
                    fontSize: SizeConfig.screenHeight!/42.69,         /// 16
                    fontWeight: FontWeight.w400),
              ),
              Padding(
                padding:
                EdgeInsets.only(top: SizeConfig.screenHeight!/136.6),  /// 5.0
                child: Text(
                  "\$${widget.food_price}",
                  style: TextStyle(
                      color: buttonColor,
                      fontSize: SizeConfig.screenHeight!/37.95,        /// 18
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
