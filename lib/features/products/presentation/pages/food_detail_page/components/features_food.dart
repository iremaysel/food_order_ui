import 'package:flutter/material.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';

class FeaturesFood extends StatefulWidget {
  const FeaturesFood({Key? key}) : super(key: key);

  @override
  _FeaturesFoodState createState() => _FeaturesFoodState();
}

class _FeaturesFoodState extends State<FeaturesFood> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ContainerFeatures(percent_text: "200+", features_text: "Calories"),
        ContainerFeatures(percent_text: "%10", features_text: "Fat"),
        ContainerFeatures(percent_text: "%40", features_text: "Proteins"),
      ],
    );
  }
}

class ContainerFeatures extends StatelessWidget {
  String percent_text;
  String features_text;
  ContainerFeatures({required this.percent_text, required this.features_text});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: SizeConfig.screenHeight!/13.66,                         /// 50.0
        width: SizeConfig.screenWidth!/4.11,                            /// 100.0
        margin: EdgeInsets.only(top: SizeConfig.screenHeight!/34.15),   /// 20.0
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.black12,
                width: SizeConfig.screenWidth!/205.5          /// 2.0
            ),
            borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(percent_text, style: TextStyle(color: Colors.black38),),
            Text(features_text,style: TextStyle(color: Colors.black38))
          ],
        )
    );
  }
}

