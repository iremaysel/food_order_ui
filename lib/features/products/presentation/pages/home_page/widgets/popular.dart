import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/size_config.dart';

import '../../../bloc/bloc/product_bloc/product_bloc.dart';
import '../../../widgets/custom_food_card.dart';

class PopularFoods extends StatelessWidget {
  const PopularFoods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _PopularFoodBody();
  }
}

class _PopularFoodBody extends StatelessWidget {
  const _PopularFoodBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, ProductState state) {
        if (state is ProductLoadindState) {
          return SizedBox(
            height: SizeConfig.blockSizeVertical! * 45,
            child: const Center(
              //TODO: hacer las cartas del cargando
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is ProductsLoadedSussesState) {
          return SizedBox(
            height: SizeConfig.blockSizeVertical! * 45,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.productList.length,
              itemBuilder: (context, index) {
                var product = state.productList[index];
                return CustomFoodCard(product: product);
              },
            ),
          );
        } else {
          return const Text('Ha occurido algun error en el server');
        }
      },
    );
  }
}
