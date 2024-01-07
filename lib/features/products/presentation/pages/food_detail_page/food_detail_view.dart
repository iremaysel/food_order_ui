import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_ui/features/products/presentation/bloc/cubit/increase_decrease_buttons_cubit.dart';

import '../../../../../core/shared/entities/product.dart';
import '../home_page/components/size_config.dart';
import 'widgets/detail_widget.dart';
import 'widgets/food_image.dart';

class FoodDetailView extends StatelessWidget {
  final Product food;
  const FoodDetailView({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: BlocProvider(
            create: (context) => IncreaseDecreaseButtonsCubit(),
            child: Stack(
              children: [
                FoodImage(product: food),
                DetailWidget(
                  product: food,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
