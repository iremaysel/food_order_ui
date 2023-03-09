import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_ui/features/main_components/bloc/cubit/nav_bar_cubit_cubit.dart';

import 'widgets/food_cart_list.dart';
import 'widgets/payments_details.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<NavBarCubitCubit>().updateIndexNavBar(0);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () =>
                  context.read<NavBarCubitCubit>().updateIndexNavBar(0),
              child: const Icon(Icons.arrow_back)),
          centerTitle: true,
          title: const Text(
            "Carrito",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: const FoodCartListWidget(),
        bottomNavigationBar: const PaymentDetails(),
      ),
    );
  }
}
