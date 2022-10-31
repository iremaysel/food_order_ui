import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_ui/features/products/presentation/bloc/bloc/five_starts_products_bloc/bloc/five_start_products_bloc_bloc.dart';

import '../../../../../../core/constantes/constantes.dart';
import '../components/size_config.dart';

class DiscountCard extends StatelessWidget {
  const DiscountCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imageList = [
      "assets/discount/discount1.png",
      "assets/discount/discount2.png",
      "assets/discount/discount3.png",
    ];
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.blockSizeVertical! * 3,
          bottom: SizeConfig.blockSizeVertical! * 2),

      /// 20.0 - 10.0
      child: BlocBuilder<FiveStartProductsBloc, FiveStartProductsBlocState>(
        builder: (context, state) {
          if (state is FiveStartProductsBlocLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is FiveStartProductsBlocLoadedSuccessState) {
            return CarouselSlider(
              options: CarouselOptions(
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
                autoPlay: false,
              ),
              items: state.fiveStartProductList
                  .map((product) => ClipRRect(
                        borderRadius: BorderRadius.circular(
                            SizeConfig.blockSizeHorizontal! * 5.5),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            product.img == 'no-image.png'
                                ? Image.asset(
                                    'assets/main/no_image.jpeg',
                                    fit: BoxFit.cover,
                                  )
                                : FadeInImage(
                                    fit: BoxFit.fill,
                                    placeholder: const AssetImage(
                                        'assets/main/loading.gif'),
                                    image: NetworkImage(
                                      '$apiUrl/uploads/products/${product.uid}',
                                    ),
                                  )
                          ],
                        ),
                      ))
                  .toList(),
            );
          } else {
            return const Text('Ha occurido algun Error');
          }
        },
      ),
    );
  }
}
