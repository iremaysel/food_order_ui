import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_ui/core/configuration/food.dart';
import 'package:food_order_ui/features/products/presentation/pages/food_detail_page/components/separator.dart';
import 'package:food_order_ui/features/products/presentation/pages/home_page/components/colors.dart';
import 'package:food_order_ui/features/products/presentation/pages/home_page/components/size_config.dart';

import '../../../bloc/cubit/increase_decrease_buttons_cubit.dart';

class IncreaseDecrease extends StatefulWidget {
  final Food food;
  const IncreaseDecrease({Key? key, required this.food}) : super(key: key);

  @override
  _IncreaseDecreaseState createState() => _IncreaseDecreaseState();
}

class _IncreaseDecreaseState extends State<IncreaseDecrease> {
  int _counter = 1;

  void _increaseCart() {
    setState(() {
      _counter++;
    });
  }

  void _decreaseCart() {
    setState(() {
      if (_counter > 1) {
        _counter--;
      } else {
        _counter = 1;
      }
    });
  }

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
                          "\$${int.parse(widget.food.foodPrice) * state.cant}",
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
