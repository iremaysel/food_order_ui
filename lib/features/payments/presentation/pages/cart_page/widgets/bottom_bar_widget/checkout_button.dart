import 'package:flutter/material.dart';
import '../../../checkout_page/checkout_page_view.dart';
import '../../../../../../products/presentation/pages/home_page/components/colors.dart';
import '../../../../../../products/presentation/pages/home_page/components/size_config.dart';

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
