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
    var categoryBloc = BlocProvider.of<CategoryBloc>(context);

    productBloc.add(ProductsStartedEvent());
    fiveStartBloc.add(StartedFiveStartProductsEvent());
    categoryBloc.add(CategoryStatedEvent());

    return FutureBuilder(
      future: Future.wait([
        productBloc.stream.firstWhere((state) => state is ProductsLoadedState),
        fiveStartBloc.stream.firstWhere(
            (state) => state is FiveStartProductsBlocLoadedSuccessState),
        categoryBloc.stream.firstWhere((state) => state is CategoryLoadedState)
      ]),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Muestra un indicador de carga mientras esperas que se carguen los datos
          return Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/main/splashscreen.gif"),
                    fit: BoxFit.cover),
              ),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          // Navega a la pantalla de inicio una vez que se cargan los datos
          favoriteBloc
              .add(StartProductToFavoritesEvent(snapshot.data![0].productList));

          return MyHomePage();
        } else {
          return const Text("Algo salio mal");
        }
      },
    );
  }
}
