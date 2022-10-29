import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_ui/features/products/presentation/bloc/bloc/product_bloc/product_bloc.dart';

import '../../auth/presentation/pages/login_page/login_page_view.dart';
import '../../products/presentation/pages/home_page/components/size_config.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    var productBloc = BlocProvider.of<ProductBloc>(context);

    productBloc.add(OnGetProductsEvent());

    return BlocListener<ProductBloc, ProductState>(
      listener: (context, ProductState state) {
        if (state is ProductsLoadedSussesState) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginPageView()));
        } else if (state is ProductErrorState) {
          SnackBar snackBar = const SnackBar(
              content: Text('Ha ocurrido algun error en el server'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (productBloc.state is ProductsLoadedSussesState) {}

          return Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/main/splashscreen.gif"),
                    fit: BoxFit.cover),
              ),
            ),
          );
        },
      ),
    );
  }
}
