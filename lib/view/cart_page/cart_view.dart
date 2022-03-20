import 'package:flutter/material.dart';
import 'package:food_order_ui/view/cart_page/widgets/bottom_bar.dart';
import 'package:food_order_ui/view/cart_page/widgets/food_list.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title : Text("My Cart", style: TextStyle(color: Colors.black),),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: FoodListWidget(),
      bottomNavigationBar: BottomBar(),
    );
  }
}
