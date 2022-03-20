import 'package:flutter/material.dart';
import 'package:food_order_ui/view/checkout_page/components/checkbox_save.dart';
import 'package:food_order_ui/view/checkout_page/components/checkout_textfield.dart';
import 'package:food_order_ui/view/checkout_page/components/page_name.dart';

class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageName(text_name: "Full Name"),
          CheckoutTextField(enter_text: "Enter your full name", size_width: 1.18,),   //350
          PageName(text_name: "Email"),
          CheckoutTextField(enter_text: "Enter your e-mail", size_width: 1.18,),
          PageName(text_name: "Phone"),
          CheckoutTextField(enter_text: "Enter your phone number", size_width: 1.18,),
          PageName(text_name: "Address"),
          CheckoutTextField(enter_text: "Type your home address", size_width: 1.18,),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PageName(text_name: "City"),
                  CheckoutTextField(enter_text: "Enter here", size_width: 3.0)
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PageName(text_name: "Country"),
                  CheckoutTextField(enter_text: "Your country", size_width: 3.0)
                ],
              )
            ],
          ),
          CheckBoxSave(save_text: "Save shipping address")
        ],
      ),
    );
  }
}
