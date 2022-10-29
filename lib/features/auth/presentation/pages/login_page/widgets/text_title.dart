import 'package:flutter/material.dart';

import '../../../../../products/presentation/pages/home_page/components/size_config.dart';

class TextTitle extends StatelessWidget {
  final String title;
  const TextTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: SizeConfig.blockSizeHorizontal! * 10,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
