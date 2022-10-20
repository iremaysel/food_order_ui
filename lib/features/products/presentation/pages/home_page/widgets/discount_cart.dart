import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_order_ui/configuration/food.dart';
import 'package:food_order_ui/configuration/food_list.dart';
import 'package:food_order_ui/features/products/presentation/pages/home_page/components/size_config.dart';

class DiscountCard extends StatelessWidget {
  const DiscountCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imageList = [
      "assets/discount/discount1.png",
      "assets/discount/discount2.png",
      "assets/discount/discount3.png",
    ];
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.blockSizeVertical! * 3,
          bottom: SizeConfig.blockSizeVertical! * 2),

      /// 20.0 - 10.0
      child: FutureBuilder<List<Food>>(
        future: bringTheFoods(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
              height: SizeConfig.blockSizeVertical! * 30,

              /// 200.0
              width: SizeConfig.screenWidth,

              /// 411.0
              child: CarouselSlider(
                options: CarouselOptions(
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                  autoPlay: false,
                ),
                items: imageList
                    .map((item) => ClipRRect(
                          borderRadius: BorderRadius.circular(
                              SizeConfig.blockSizeHorizontal! * 5.5),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset(
                                item,
                                fit: BoxFit.cover,
                              )
                            ],
                          ),
                        ))
                    .toList(),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
