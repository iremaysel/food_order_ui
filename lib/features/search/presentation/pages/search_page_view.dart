import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_ui/features/search/presentation/bloc/search_bloc.dart';
import '../../../main_components/bloc/cubit/nav_bar_cubit_cubit.dart';
import '../../../products/presentation/pages/home_page/components/size_config.dart';
import '../../../products/presentation/widgets/custom_food_card.dart';
import '../widgets/search_textfield.dart';

class SearchPageView extends StatelessWidget {
  const SearchPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<NavBarCubitCubit>().updateIndexNavBar(0);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () =>
                  context.read<NavBarCubitCubit>().updateIndexNavBar(0),
              child: const Icon(Icons.arrow_back)),
          centerTitle: true,
          title: const Text(
            "Buscar",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Column(
          children: [
            const SearchTextField(hintText: "Buscar"),
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is SearchLoadingState) {
                  return const SizedBox();
                }
                if (state is SearchLoadedState) {
                  if (state.products.isEmpty) {
                    return Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: SizeConfig.blockSizeVertical! * 15,
                              child: const Image(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage('assets/food/no_food.jpg'))),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 5,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            'No se han encontrado productos',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.blockSizeHorizontal! * 5),
                          )
                        ],
                      ),
                    );
                  }
                  return Expanded(
                    child: GridView.builder(
                        itemCount: state.products.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 3 / 4,
                        ),
                        itemBuilder: (context, index) {
                          var product = state.products[index];
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    SizeConfig.blockSizeHorizontal! * 2),
                            child: CustomFoodCard(
                              product: product,
                              isWishList: false,
                            ),
                          );
                        }),
                  );
                }
                if (state is SearchErrorState) {
                  const Text("Error State");
                }

                if (state is SearchInitialState) {
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: SizeConfig.blockSizeVertical! * 15,
                            child: const Image(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/food/no_food.jpg'))),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 5,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'Busque para encontrar Porductos',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.blockSizeHorizontal! * 5),
                        )
                      ],
                    ),
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
