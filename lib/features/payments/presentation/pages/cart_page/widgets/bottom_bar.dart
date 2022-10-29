import 'package:flutter/material.dart';
import 'bottom_bar_widget/3d_secure.dart';
import 'bottom_bar_widget/bottombar_text.dart';
import 'bottom_bar_widget/checkout_button.dart';
import '../../../../../products/presentation/pages/food_detail_page/components/separator.dart';
import '../../../../../products/presentation/pages/home_page/components/size_config.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.blockSizeVertical! * 5,
        horizontal: SizeConfig.blockSizeHorizontal! * 6,
      ),
      // height: 174,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(bottom: SizeConfig.blockSizeVertical! * 5),

              /// 8.0
              child: const MySeparator(
                color: Colors.grey,
              ),
            ),
            const ThreeDSecure(),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),

            /// 15.0
            BottomBarText(
                titletext: "Subtotal",
                pricetext: "\$37.0",
                fontsize: SizeConfig.blockSizeHorizontal! * 4.5,
                fontWeight: FontWeight.w400,
                textcolor: Colors.black54),

            /// 15
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            BottomBarText(
              titletext: "Discount",
              pricetext: "\$2.0",
              fontsize: SizeConfig.blockSizeHorizontal! * 4.5,
              fontWeight: FontWeight.w400,
              textcolor: Colors.black54,
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            BottomBarText(
              titletext: "Total",
              pricetext: "\$35.0",
              fontsize: SizeConfig.blockSizeHorizontal! * 6,
              fontWeight: FontWeight.bold,
              textcolor: Colors.black,
            ),

            /// 18
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 3,
            ),

            /// 20.0
            const CheckoutButton(),
          ],
        ),
      ),
    );
  }
}
