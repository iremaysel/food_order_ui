import 'package:flutter/material.dart';
import 'package:food_order_ui/view/home_page/components/colors.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(
          SizeConfig.screenWidth!/20.55,
          SizeConfig.screenHeight!/34.15,
          SizeConfig.screenWidth!/20.55,
          0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            minimumSize: MaterialStateProperty.all(Size(SizeConfig.screenWidth!/1.37, SizeConfig.screenHeight!/11.66)),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: () { },
          child: Wrap(
            children: [
              Padding(
                padding: EdgeInsets.only(right: SizeConfig.screenWidth!/51.38),       /// 8.0
                child: Icon(Icons.shopping_cart_rounded , color: Colors.white,),
              ),
              Text(
                "Add to Cart",
                style: TextStyle(fontSize: SizeConfig.screenHeight!/34.15,  fontWeight: FontWeight.w700, color: Colors.white,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
