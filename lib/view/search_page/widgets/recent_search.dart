import 'package:flutter/material.dart';
import 'package:food_order_ui/view/home_page/components/colors.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';

class RecentSearch extends StatefulWidget {
  const RecentSearch({Key? key}) : super(key: key);

  @override
  _RecentSearchState createState() => _RecentSearchState();
}

class _RecentSearchState extends State<RecentSearch> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          SizeConfig.screenWidth!/18.68,               /// 22.0
          SizeConfig.screenHeight!/ 68.3,              /// 10.0
          SizeConfig.screenWidth!/18.68,               /// 22.0
          SizeConfig.screenHeight!/85.38               /// 8.0
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Recent Search", style: TextStyle(fontSize: SizeConfig.screenHeight!/37.95, fontWeight: FontWeight.w400),),  /// 18
          Text("Clear All", style: TextStyle(color: lightColor, fontSize: SizeConfig.screenHeight!/45.54),)                 /// 15
        ],
      ),
    );
  }
}
