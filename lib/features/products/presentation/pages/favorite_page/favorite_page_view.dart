import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../main_components/bloc/cubit/nav_bar_cubit_cubit.dart';
import '../../bloc/bloc/favorites_bloc/favorites_bloc.dart';
import '../../widgets/custom_food_card.dart';
import '../home_page/components/size_config.dart';

class FavoritePageView extends StatelessWidget {
  const FavoritePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => context.read<NavBarCubitCubit>().updateIndexNavBar(0),
            child: const Icon(Icons.arrow_back)),
        centerTitle: true,
        title: const Text(
          "Favoritos",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal! * 1,
              vertical: SizeConfig.blockSizeVertical! * 1),
          child: BlocBuilder<FavoritesBloc, FavoritesState>(
            builder: (context, FavoritesState state) {
              if (state is FavoritesLoadedState) {
                if (state.productList.isEmpty) {
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: SizeConfig.blockSizeVertical! * 35,
                            child: const Image(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/food/no_food.jpg'))),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 5,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'No hay Productos agrdegados a favoritos',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.blockSizeHorizontal! * 6),
                        )
                      ],
                    ),
                  );
                }

                return GridView.builder(
                    itemCount: state.productList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 3,
                    ),
                    itemBuilder: (context, index) {
                      var product = state.productList[index];
                      return CustomFoodCard(
                        product: product,
                        isWishList: true,
                      );
                    });
              } else if (state is FavoritesErrorState) {
                return Text(state.message);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )),
    );
  }
}
