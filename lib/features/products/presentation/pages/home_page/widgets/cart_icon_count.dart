import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../main_components/bloc/cubit/nav_bar_cubit_cubit.dart';
import '../../../../../payments/presentation/bloc/cart_bloc.dart';
import '../components/colors.dart';
import '../components/size_config.dart';

class CartIconCount extends StatelessWidget implements TickerProvider {
  const CartIconCount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AnimationController animationController = AnimationController(
        vsync: this, duration: const Duration(microseconds: 500));

    return GestureDetector(
      onTap: () {
        context.read<NavBarCubitCubit>().updateIndexNavBar(2);
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      },
      child: BlocListener<CartBloc, CartState>(
        listener: (context, state) {
          if (state is CartLoadedState) {
            animationController.forward(from: 0.0);
          }
        },
        child: Stack(
          children: [
            Container(
                height: SizeConfig.blockSizeVertical! * 6,
                width: SizeConfig.blockSizeHorizontal! * 11,
                decoration: BoxDecoration(
                    color: buttonColor.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(
                        SizeConfig.blockSizeHorizontal! * 20)),
                child: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                )),
            Positioned(
              right: SizeConfig.blockSizeHorizontal! * 2,
              top: SizeConfig.blockSizeVertical! * 0.8,
              child: Builder(builder: (context) {
                final cartBlocState = context.watch<CartBloc>().state;

                if (cartBlocState is CartLoadedState &&
                    cartBlocState.cart.product.isNotEmpty) {
                  return BounceInDown(
                    from: 20,
                    child: Bounce(
                      from: 20,
                      controller: (controller) =>
                          animationController = controller,
                      child: Container(
                        height: SizeConfig.blockSizeVertical! * 1.8,
                        width: cartBlocState.cart.product.length < 100
                            ? SizeConfig.blockSizeVertical! * 1.8
                            : SizeConfig.blockSizeVertical! * 3,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            cartBlocState.cart.product.length.toString(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 10),
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              }),
            )
          ],
        ),
      ),
    );
  }

  @override
  Ticker createTicker(TickerCallback onTick) => Ticker(onTick);
}
