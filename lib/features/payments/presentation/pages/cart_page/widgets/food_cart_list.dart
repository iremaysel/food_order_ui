import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/shared/entities/product.dart';
import 'package:lottie/lottie.dart';
import '../../../bloc/cart_bloc.dart';
import 'food_list_widget/delete_icon_button.dart';
import 'food_list_widget/food_text.dart';
import 'food_list_widget/food_image.dart';
import '../../../../../products/presentation/pages/home_page/components/size_config.dart';

class FoodCartListWidget extends StatelessWidget {
  const FoodCartListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartBloc = BlocProvider.of<CartBloc>(context);
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal! * 5),
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, CartState state) {
            if (state is CartInitial) {
              return Center(
                child: SizedBox(
                    height: SizeConfig.blockSizeVertical! * 30,
                    child: Center(
                      child: Lottie.asset(
                        'assets/discount/cart.json',
                        fit: BoxFit.cover,
                      ),
                    )),
              );
            }

            if (state is CartLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is CartLoadedState) {
              var foodList = state.cart.product;

              if (foodList.isEmpty) {
                return Center(
                  child: SizedBox(
                      height: SizeConfig.blockSizeVertical! * 30,
                      child: Center(
                        child: Lottie.asset(
                          'assets/discount/cart.json',
                          fit: BoxFit.cover,
                        ),
                      )),
                );
              }

              return ListView.builder(
                  itemCount: state.cart
                      .productQuantity(state.cart.product)
                      .keys
                      .length,
                  itemBuilder: (context, int index) {
                    return HorizontalCartCardFood(
                      product: state.cart
                          .productQuantity(state.cart.product)
                          .keys
                          .elementAt(index),
                      quantity: state.cart
                          .productQuantity(state.cart.product)
                          .values
                          .elementAt(index),
                    );
                  });
            } else if (state is CartErrorState) {
              return const Text("Ha ocurrido algun Error");
            } else {
              return Container();
            }
          },
        ));
  }
}

class HorizontalCartCardFood extends StatelessWidget {
  const HorizontalCartCardFood({
    Key? key,
    required this.product,
    required this.quantity,
  }) : super(key: key);

  final Product product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical! * 1),

      /// 10.0
      child: Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          BlocProvider.of<CartBloc>(context)
              .add(RemovedProductToCartEvent(product));
        },
        background: Container(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal! * 2),

          /// 20.0
          decoration: BoxDecoration(
            color: const Color(0xFFFFE6E6),
            borderRadius:
                BorderRadius.circular(SizeConfig.blockSizeVertical! * 3),
          ),
          child: Row(
            children: const [Spacer(), Icon(Icons.delete_outline)],
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(SizeConfig.blockSizeVertical! * 3),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(4, 6),
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.1),
                )
              ]),
          child: Row(
            children: [
              FoodImage(product: product),
              SizedBox(width: SizeConfig.blockSizeHorizontal! * 3),
              FoodTextBody(
                foodName: product.name ?? "no name",
                foodPrice: product.price.toString(),
                cantity: quantity,
              ),
              const Spacer(),
              DeleteIconButton(product: product),
            ],
          ),
        ),
      ),
    );
  }
}
