import 'package:flutter/material.dart';
import 'package:food_order_ui/features/products/presentation/pages/home_page/components/size_config.dart';

class MySeparator extends StatelessWidget {
  final double height;
  final Color color;
  const MySeparator({
    Key? key,
    this.height = 1,
    this.color = Colors.black38,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = SizeConfig.blockSizeHorizontal! * 2;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}
