import 'package:flutter/material.dart';
import 'package:food_order_ui/features/products/presentation/pages/home_page/components/colors.dart';
import 'package:food_order_ui/features/products/presentation/pages/home_page/components/size_config.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(
        SizeConfig.blockSizeHorizontal! * 10,
        SizeConfig.blockSizeVertical! * 2,
        SizeConfig.blockSizeHorizontal! * 10,
        0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(
            SizeConfig.blockSizeHorizontal! * 5,
          ),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  SizeConfig.blockSizeHorizontal! * 5,
                ),
              ),
            ),
            minimumSize: MaterialStateProperty.all(Size(
              SizeConfig.blockSizeHorizontal! * 75,
              SizeConfig.blockSizeVertical! * 8,
            )),
          ),
          onPressed: () {},
          child: Wrap(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  right: SizeConfig.blockSizeHorizontal! * 2,
                ),
                child: const Icon(
                  Icons.shopping_cart_rounded,
                  color: Colors.white,
                ),
              ),
              Text(
                "Añadir al carrito",
                style: TextStyle(
                  fontSize: SizeConfig.blockSizeVertical! * 2.8,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
