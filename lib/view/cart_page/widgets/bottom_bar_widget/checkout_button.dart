import 'package:flutter/material.dart';
import 'package:food_order_ui/view/checkout_page/checkout_page_view.dart';
import 'package:food_order_ui/view/home_page/components/colors.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';

class CheckoutButton extends StatefulWidget {
  const CheckoutButton({Key? key}) : super(key: key);

  @override
  _CheckoutButtonState createState() => _CheckoutButtonState();
}

class _CheckoutButtonState extends State<CheckoutButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CheckoutPageView()));
      },
      child: Container(
          width: SizeConfig.screenWidth!/1.02 ,             /// 400.0
          height: SizeConfig.screenHeight!/12.42,           /// 55.0
          decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(30)
          ),
          child: Center(
              child: Text("Checkout",
                style: TextStyle(color: Colors.white, fontSize: SizeConfig.screenHeight!/34.15, fontWeight: FontWeight.bold),     /// 20.0
              )
          )
      ),
    );
  }
}
