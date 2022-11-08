import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_ui/features/main_components/pages/bottom_navigator.dart';
import 'package:food_order_ui/features/products/presentation/bloc/bloc/five_starts_products_bloc/bloc/five_start_products_bloc_bloc.dart';
import 'package:food_order_ui/features/products/presentation/bloc/bloc/product_bloc/product_bloc.dart';

import '../../products/presentation/bloc/bloc/category/category_bloc.dart';
import '../../products/presentation/bloc/bloc/favorites_bloc/favorites_bloc.dart';
import '../../products/presentation/pages/home_page/components/size_config.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    var favoriteBloc = BlocProvider.of<FavoritesBloc>(context);
    var productBloc = BlocProvider.of<ProductBloc>(context);
    var fiveStartBloc = BlocProvider.of<FiveStartProductsBloc>(context);

    productBloc.add(ProductsStartedEvent());
    fiveStartBloc.add(StartedFiveStartProductsEvent());

    return BlocListener<ProductBloc, ProductState>(
        listener: (context, ProductState state) {
          if (state is ProductsLoadedSussesState) {
            favoriteBloc.add(StartProductToFavoritesEvent(state.productList));
          } else if (state is ProductErrorState) {
            SnackBar snackBar = const SnackBar(
                content: Text('Ha ocurrido algun error en el server'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: BlocListener<FiveStartProductsBloc, FiveStartProductsBlocState>(
          listener: (context, state) {},
          child: BlocListener<CategoryBloc, CategoryState>(
            listener: (context, state) {
              if (state is CategoryLoadedState) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              }
            },
            child: Scaffold(
              body: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/main/splashscreen.gif"),
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
        ));
  }
}
