import 'package:flutter/material.dart';

import '../../../../../products/presentation/pages/home_page/components/colors.dart';
import '../../../../../products/presentation/pages/home_page/components/size_config.dart';
import '../components/CustomShape.dart';

class TopCustomShape extends StatelessWidget {
  const TopCustomShape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.blockSizeVertical! * 32,
      child: Stack(
        children: [
          ClipPath(
            clipper: CustomShape(),
            child: Container(
              height: SizeConfig.blockSizeVertical! * 22,

              /// 150.0
              color: buttonColor,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: SizeConfig.blockSizeVertical! * 22,

                  /// 140.0
                  width: SizeConfig.blockSizeHorizontal! * 35,

                  /// 140.0
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: SizeConfig.blockSizeHorizontal! * 1,
                      ),
                      color: Colors.white,
                      image: const DecorationImage(
                          image: AssetImage("assets/main/avatar.png"))),
                ),
                const Text(
                  "Roger Luis",
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! / 136.6,
                ),

                /// 5.0
                const Text(
                  "rogerordaz98@gmail.com",
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.black45),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
