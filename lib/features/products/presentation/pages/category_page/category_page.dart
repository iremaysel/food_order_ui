import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_ui/features/products/domain/entities/category.dart';
import 'package:food_order_ui/features/products/presentation/bloc/bloc/product_by_category.dart/product_by_category_bloc.dart';

import '../../widgets/custom_food_card.dart';
import '../home_page/components/size_config.dart';

class CategoryPageView extends StatelessWidget {
  final Category category;
  const CategoryPageView({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back)),
        centerTitle: true,
        title: Text(
          category.name,
          style: const TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal! * 1,
              vertical: SizeConfig.blockSizeVertical! * 1),
          child: BlocBuilder<ProductByCategoryBloc, ProductByCategoryState>(
            builder: (context, state) {
              if (state is ProductByCategoryLoaded) {
                if (state.products.isEmpty) {
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
                          'No hay Productos disponibles para esta categoria',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.blockSizeHorizontal! * 6),
                        )
                      ],
                    ),
                  );
                }

                return GridView.builder(
                    itemCount: state.products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 3,
                    ),
                    itemBuilder: (context, index) {
                      var product = state.products[index];
                      return CustomFoodCard(
                        product: product,
                        isWishList: false,
                      );
                    });
              } else if (state is ProductByCategoryError) {
                return const Center(
                    child: Text(
                  'Ha sucedidio algo con la respuesta del server\nIntente mas tarde',
                  textAlign: TextAlign.center,
                ));
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
