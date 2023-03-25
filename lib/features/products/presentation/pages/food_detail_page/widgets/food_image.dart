import 'package:flutter/material.dart';

import '../../../../../../core/constantes/constantes.dart';
import '../../../../../../core/shared/entities/product.dart';
import '../../home_page/components/size_config.dart';
import '../../home_page/widgets/cart_icon_count.dart';
import '../components/arrow_back.dart';
import '../components/favorite_food.dart';

class FoodImage extends StatelessWidget {
  final Product product;
  const FoodImage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO:Hero Animation to Pictures...

    SizeConfig().init(context);
    return Stack(
      children: [
        SizedBox(
            height: SizeConfig.blockSizeVertical! * 38,
            child: product.image == 'no-image.png'
                ? Image.asset(
                    'assets/main/no_image.jpeg',
                    fit: BoxFit.fill,
                  )
                : FadeInImage(
                    fit: BoxFit.cover,
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/main/no_image.jpeg',
                        fit: BoxFit.cover,
                      );
                    },
                    placeholder: const AssetImage('assets/main/loading.gif'),
                    image: NetworkImage(
                      '$apiUrl/uploads/products/${product.id}',
                    ),
                  )),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal! * 5,
              vertical: SizeConfig.blockSizeVertical! * 3),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ArrowBack(),
              const Spacer(),
              FavoriteFood(product: product),
              const CartIconCount()
            ],
          ),
        ),
      ],
    );
  }
}
