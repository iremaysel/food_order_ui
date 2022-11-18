import 'package:flutter/material.dart';

import '../../../../../products/presentation/pages/home_page/components/colors.dart';
import '../../../../../products/presentation/pages/home_page/components/size_config.dart';

class CheckoutTextField extends StatelessWidget {
  final String enterText;
  final double sizewidth;
  final bool? enabled;
  const CheckoutTextField(
      {super.key,
      required this.enterText,
      required this.sizewidth,
      this.enabled});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(SizeConfig.screenWidth! / 41.1, 0,
          SizeConfig.screenWidth! / 82.2, SizeConfig.screenHeight! / 85.37),
      child: Container(
        width: SizeConfig.screenWidth! / sizewidth,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        ),
        child: TextFormField(
          enabled: enabled,
          style: TextStyle(color: textColor),
          cursorColor: textColor,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderSide: BorderSide(width: 1, color: Colors.transparent),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            hintText: enterText,
            hintStyle: const TextStyle(color: Colors.black26),
          ),
        ),
      ),
    );
  }
}
