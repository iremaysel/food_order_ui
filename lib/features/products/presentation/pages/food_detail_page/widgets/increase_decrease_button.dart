import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/separator.dart';
import '../../home_page/components/colors.dart';
import '../../home_page/components/size_config.dart';

import '../../../../../../core/shared/entities/product.dart';
import '../../../bloc/cubit/increase_decrease_buttons_cubit.dart';

class IncreaseDecrease extends StatelessWidget {
  final Product product;
  const IncreaseDecrease({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (context) => IncreaseDecreaseButtonsCubit(),
      child: Padding(
        padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical! * 3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(bottom: SizeConfig.blockSizeVertical! * 4),
              child: const MySeparator(
                color: Colors.grey,
              ),
            ),
            Text(
              "Total",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: SizeConfig.blockSizeVertical! * 2.5),
            ),

            /// 16
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<IncreaseDecreaseButtonsCubit,
                        IncreaseDecreaseButtonsState>(
                      builder: (context, state) {
                        return Text(
                          "\$${product.price * state.cant}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.blockSizeVertical! * 4),
                        );
                      },
                    )

                    /// 25
                  ],
                ),
                BlocBuilder<IncreaseDecreaseButtonsCubit,
                    IncreaseDecreaseButtonsState>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CountButton(
                          iconType: Icons.remove,
                          onPressed: context
                              .read<IncreaseDecreaseButtonsCubit>()
                              .decrement,
                          color: textColor.withOpacity(0.1),
                        ),
                        SizedBox(
                          width: SizeConfig.blockSizeHorizontal! * 12,
                          child: Center(
                            child: Text(
                              state.cant.toString(),
                              style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal! * 6,
                                  fontWeight: FontWeight.bold),
                            ),

                            /// 18
                          ),
                        ),
                        CountButton(
                          iconType: Icons.add,
                          onPressed: context
                              .read<IncreaseDecreaseButtonsCubit>()
                              .increment,
                          color: textColor.withOpacity(0.4),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CountButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;
  final IconData iconType;

  const CountButton({
    Key? key,
    required this.onPressed,
    required this.color,
    required this.iconType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: SizeConfig.blockSizeVertical! * 7.5,
        width: SizeConfig.blockSizeHorizontal! * 12,
        decoration: BoxDecoration(
          border: Border.all(color: buttonColor, width: 1),
          borderRadius:
              BorderRadius.circular(SizeConfig.blockSizeVertical! * 2),
          color: color,
        ),
        child: Center(
          child: Icon(iconType, color: buttonColor),
        ),
      ),
    );
  }
}
