import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_ui/features/products/presentation/bloc/cubit/increase_decrease_buttons_cubit.dart';

import '../../../../../../core/shared/entities/product.dart';
import '../../../../../payments/presentation/bloc/cart_bloc.dart';
import '../../home_page/components/colors.dart';
import '../../home_page/components/size_config.dart';

class AddToCartButton extends StatelessWidget {
  final Product product;
  const AddToCartButton({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var count = BlocProvider.of<IncreaseDecreaseButtonsCubit>(context);
    SizeConfig().init(context);
    return BlocListener<CartBloc, CartState>(
      listener: (context, state) {
        if (state is CartLoadedState) {}
      },
      child: Padding(
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
            onPressed: () {
              for (var i = 0; i < count.state.cant; i++) {
                BlocProvider.of<CartBloc>(context)
                    .add(AddedProductToCartEvent(product));
              }

              var snackBar = SnackBar(
                  duration: const Duration(milliseconds: 1200),
                  content: Text(
                      'Se adiciono ${count.state.cant} productos al carrito'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
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
      ),
    );
  }
}
