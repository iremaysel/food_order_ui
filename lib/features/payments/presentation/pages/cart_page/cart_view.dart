import 'package:flutter/material.dart';

import 'widgets/food_cart_list.dart';
import 'widgets/payments_details.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
    );
  }
}
