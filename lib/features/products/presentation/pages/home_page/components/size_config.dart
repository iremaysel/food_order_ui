import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;

    /// 683
    screenHeight = _mediaQueryData!.size.height;
    blockSizeVertical = screenHeight! / 100;
    blockSizeHorizontal = screenWidth! / 100;
  }
}
