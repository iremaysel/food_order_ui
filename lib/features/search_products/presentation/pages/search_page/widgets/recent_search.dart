import 'package:flutter/material.dart';

import '../../../../../products/presentation/pages/home_page/components/colors.dart';
import '../../../../../products/presentation/pages/home_page/components/size_config.dart';

class RecentSearch extends StatefulWidget {
  const RecentSearch({Key? key}) : super(key: key);

  @override
  _RecentSearchState createState() => _RecentSearchState();
}

class _RecentSearchState extends State<RecentSearch> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.blockSizeHorizontal! * 5,
        vertical: SizeConfig.blockSizeVertical! * 1,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Recent Search",
            style: TextStyle(
                fontSize: SizeConfig.blockSizeHorizontal! * 5,
                fontWeight: FontWeight.w400),
          ),

          /// 18
          Text(
            "Clear All",
            style: TextStyle(
                color: lightColor,
                fontSize: SizeConfig.blockSizeHorizontal! * 4.5),
          )

          /// 15
        ],
      ),
    );
  }
}
