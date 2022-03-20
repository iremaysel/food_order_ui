import 'package:flutter/material.dart';
import 'package:food_order_ui/view/checkout_page/components/checkbox_save.dart';
import 'package:food_order_ui/view/checkout_page/components/checkout_textfield.dart';
import 'package:food_order_ui/view/checkout_page/components/page_name.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageName(text_name: "Card Holder Name"),
          CheckoutTextField(enter_text: "Your card holder name", size_width: 1.18,),   //350
          PageName(text_name: "Card Number"),
          CheckoutTextField(enter_text: "Your card number", size_width: 1.18,),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PageName(text_name: "Month/Year"),
                  CheckoutTextField(enter_text: "mm/yy", size_width: 3.0)
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PageName(text_name: "CVV"),
                  CheckoutTextField(enter_text: "***", size_width: 3.0)
                ],
              )
            ],
          ),
          CheckBoxSave(save_text: "Save this card")
        ],
      ),
    );
  }
}
