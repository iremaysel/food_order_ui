import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../products/presentation/pages/home_page/components/size_config.dart';

class LottieWidget extends StatelessWidget {
  const LottieWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.network(
          "https://assets8.lottiefiles.com/packages/lf20_jz2wa00k.json",
          height: SizeConfig.screenHeight! / 2.28,

          /// 300
          width: SizeConfig.screenWidth! / 1.37,

          /// 300
          repeat: false),
    );
  }
}
