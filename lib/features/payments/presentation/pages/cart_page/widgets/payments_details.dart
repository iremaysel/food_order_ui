import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../products/presentation/pages/food_detail_page/components/separator.dart';
import '../../../../../products/presentation/pages/home_page/components/size_config.dart';
import '../../../bloc/cart_bloc.dart';
import 'bottom_bar_widget/3d_secure.dart';
import 'bottom_bar_widget/bottombar_text.dart';
import 'bottom_bar_widget/checkout_button.dart';

class PaymentDetails extends StatelessWidget {
  const PaymentDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartBloc = BlocProvider.of<CartBloc>(context);
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.blockSizeVertical! * 3,
        horizontal: SizeConfig.blockSizeHorizontal! * 6,
      ),
      // height: 174,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: SafeArea(
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoadedState) {
              if (state.listProducts.isEmpty) {
                return const SizedBox();
              }
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: SizeConfig.blockSizeVertical! * 1),

                    /// 8.0
                    child: const MySeparator(
                      color: Colors.grey,
                    ),
                  ),
                  const ThreeDSecure(),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 2,
                  ),

                  /// 15.0
                  BottomBarText(
                      titletext: "SubTotal",
                      pricetext: "\$${cartBloc.subTotalString}",
                      fontsize: SizeConfig.blockSizeHorizontal! * 4.5,
                      fontWeight: FontWeight.w400,
                      textcolor: Colors.black54),

                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 2,
                  ),
                  BottomBarText(
                      titletext: "Domicio",
                      pricetext: "\$${cartBloc.deliveryFeeString}",
                      fontsize: SizeConfig.blockSizeHorizontal! * 4.5,
                      fontWeight: FontWeight.w400,
                      textcolor: Colors.black54),

                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 2,
                  ),
                  BottomBarText(
                    titletext: "Entrega Gratis",
                    pricetext: cartBloc.freeDeliveryString,
                    fontsize: SizeConfig.blockSizeHorizontal! * 4.5,
                    fontWeight: FontWeight.w400,
                    textcolor: Colors.black54,
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 2,
                  ),
                  BottomBarText(
                    titletext: "Total",
                    pricetext: "\$${cartBloc.totalString}",
                    fontsize: SizeConfig.blockSizeHorizontal! * 6,
                    fontWeight: FontWeight.bold,
                    textcolor: Colors.black,
                  ),

                  /// 18
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 3,
                  ),

                  /// 20.0
                  const CheckoutButton(),
                ],
              );
            }
            if (state is CartLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
