import 'package:flutter/material.dart';
import 'package:food_order_ui/features/payments/presentation/pages/checkout_page/checkout_page_view.dart';
import 'package:food_order_ui/features/products/presentation/pages/home_page/components/colors.dart';
import 'package:food_order_ui/features/products/presentation/pages/home_page/components/size_config.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const CheckoutPageView()));
      },
      child: Container(
          height: SizeConfig.blockSizeVertical! * 7.5,
          decoration: BoxDecoration(
              color: buttonColor, borderRadius: BorderRadius.circular(30)),
          child: Center(
              child: Text(
            "Pagar Ahora",
            style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.blockSizeHorizontal! * 6,
                fontWeight: FontWeight.bold),

            /// 20.0
          ))),
    );
  }
}
