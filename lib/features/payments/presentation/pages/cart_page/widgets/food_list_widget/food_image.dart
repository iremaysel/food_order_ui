import 'package:flutter/material.dart';
import '../../../../../../../core/constantes/constantes.dart';

import '../../../../../../../core/shared/entities/product.dart';
import '../../../../../../products/presentation/pages/home_page/components/size_config.dart';

class FoodImage extends StatelessWidget {
  final Product product;
  const FoodImage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: SizeConfig.blockSizeVertical! * 10,
        width: SizeConfig.blockSizeHorizontal! * 25,
        child: product.img == 'no-image.png'
            ? ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(SizeConfig.blockSizeHorizontal! * 4),
                ),
                child: Image.asset(
                  'assets/main/no_image.jpeg',
                  fit: BoxFit.cover,
                ),
              )
            : ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(SizeConfig.blockSizeHorizontal! * 4),
                ),
                child: FadeInImage(
                  fit: BoxFit.fill,
                  placeholder: const AssetImage('assets/main/loading.gif'),
                  image: NetworkImage(
                    '$apiUrl/uploads/products/${product.uid}',
                  ),
                ),
              ));
  }
}
