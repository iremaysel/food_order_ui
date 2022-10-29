import 'package:flutter/material.dart';
import '../../../../../../products/presentation/pages/home_page/components/colors.dart';
import '../../../../../../products/presentation/pages/home_page/components/size_config.dart';

class ThreeDSecure extends StatelessWidget {
  const ThreeDSecure({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.receipt_long_outlined, color: buttonColor),
        const Spacer(),
        const Text(
          "Payment ",
        ),
        Icon(
          Icons.arrow_forward_ios,
          size: SizeConfig.blockSizeVertical! * 1.6,
          color: Colors.black26,
        ),
      ],
    );
  }
}
