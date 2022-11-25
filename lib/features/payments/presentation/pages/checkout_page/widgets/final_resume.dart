import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_ui/features/payments/presentation/pages/cart_page/widgets/payments_details.dart';
import 'package:lottie/lottie.dart';

import '../../../../../products/presentation/pages/home_page/components/size_config.dart';
import '../../../bloc/cart_bloc.dart';

class FinalResume extends StatelessWidget {
  const FinalResume({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          ListProducts(),
          PaymentDetails(
            isFinalStep: true,
          )
        ],
      ),
    );
  }
}

class ListProducts extends StatelessWidget {
  const ListProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoadedState) {
          var foodList = state.cart.product;

          if (foodList.isEmpty) {
            return Center(
              child: SizedBox(
                  height: SizeConfig.blockSizeVertical! * 30,
                  child: Center(
                    child: Lottie.asset(
                      'assets/discount/cart.json',
                      fit: BoxFit.cover,
                    ),
                  )),
            );
          }

          return SizedBox(
            height: 200,
            child: ListView.builder(
                itemCount:
                    state.cart.productQuantity(state.cart.product).keys.length,
                itemBuilder: (context, int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(state.cart.product[index].name!),
                      Text(state.cart.product[index].price!.toString()),
                    ],
                  );
                }),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
