import 'package:flutter/material.dart';
import '../../../../../../core/constantes/constantes.dart';
import '../../../../domain/entities/product.dart';
import '../components/arrow_back.dart';
import '../components/favorite_food.dart';
import '../../home_page/components/size_config.dart';

class FoodImage extends StatelessWidget {
  final Product product;
  const FoodImage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(
      children: [
        SizedBox(
            height: SizeConfig.blockSizeVertical! * 38,
            child: product.img == 'no-image.png'
                ? Image.asset(
                    'assets/main/no_image.jpeg',
                    fit: BoxFit.cover,
                  )
                : FadeInImage(
                    fit: BoxFit.fill,
                    placeholder: const AssetImage('assets/main/loading.gif'),
                    image: NetworkImage(
                      '$apiUrl/uploads/products/${product.uid}',
                    ),
                  )),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal! * 5,
              vertical: SizeConfig.blockSizeVertical! * 3),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const ArrowBack(),
              FavoriteFood(product: product),
            ],
          ),
        ),
      ],
    );
  }
}
