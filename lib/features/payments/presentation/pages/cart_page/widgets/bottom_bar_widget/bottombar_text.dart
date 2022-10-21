import 'package:flutter/material.dart';

class BottomBarText extends StatelessWidget {
  final String titletext;
  final String pricetext;
  final double fontsize;
  final FontWeight fontWeight;
  final Color textcolor;

  const BottomBarText(
      {Key? key,
      required this.titletext,
      required this.pricetext,
      required this.fontsize,
      required this.fontWeight,
      required this.textcolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          titletext,
          style: TextStyle(
              fontWeight: fontWeight, fontSize: fontsize, color: textcolor),
        ),
        const Spacer(),
        Text(
          pricetext,
          style: TextStyle(
              fontWeight: fontWeight, fontSize: fontsize, color: textcolor),
        ),
      ],
    );
  }
}
