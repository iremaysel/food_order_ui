import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          )

          /// 20.0 - 5.0
          // child: FutureBuilder<List<Food>>(
          //     future: bringTheFoods(),
          //     builder: (context, snapshot) {
          //       if (snapshot.hasData) {
          //         var foodList = snapshot.data;
          //         return GridView.builder(
          //             itemCount: foodList!.length,
          //             gridDelegate:
          //                 const SliverGridDelegateWithFixedCrossAxisCount(
          //               crossAxisCount: 2,
          //               childAspectRatio: 2 / 3,
          //             ),
          //             itemBuilder: (context, index) {
          //               var food = foodList[index];
          //               //  return CustomFoodCard(food: food);
          //               return Container();
          //             });
          //       } else {
          //         return Padding(
          //           padding:
          //               EdgeInsets.only(top: SizeConfig.screenHeight! / 3.10),
          //           child: Column(
          //             children: [
          //               Center(
          //                   child: Icon(
          //                 Icons.favorite,
          //                 color: Colors.black12,
          //                 size: SizeConfig.screenHeight! / 11.39,
          //               )),

          //               /// 60.0
          //               SizedBox(
          //                 height: SizeConfig.screenHeight! / 34.15,
          //               ),

          //               /// 20.0
          //               Center(
          //                   child: Text(
          //                 "Your Favorite Foods",
          //                 style: TextStyle(
          //                     color: Colors.black12,
          //                     fontSize: SizeConfig.screenHeight! / 34.15),
          //               ))
          //             ],
          //           ),
          //         );
          //       }
          //     }),
          ),
    );
  }
}
