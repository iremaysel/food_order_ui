import 'package:flutter/material.dart';

import '../components/checkbox_save.dart';
import '../components/checkout_textfield.dart';
import '../components/page_name.dart';

class Payment extends StatelessWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabelName(textName: "Card Holder Name"),
          const CheckoutTextField(
            enterText: "Your card holder name",
            sizewidth: 1.18,
          ), //350
          LabelName(textName: "Card Number"),
          const CheckoutTextField(
            enterText: "Your card number",
            sizewidth: 1.18,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabelName(textName: "Month/Year"),
                  const CheckoutTextField(enterText: "mm/yy", sizewidth: 3.0)
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabelName(textName: "CVV"),
                  const CheckoutTextField(enterText: "***", sizewidth: 3.0)
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
