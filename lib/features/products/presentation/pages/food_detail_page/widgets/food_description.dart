import 'package:flutter/material.dart';

import '../../../../../../core/shared/entities/product.dart';
import '../../home_page/components/size_config.dart';

class FoodDescription extends StatelessWidget {
  final Product product;
  const FoodDescription({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical! * 2),

      /// 15.0
      child: Text(
        product.description ?? "El Producto no tiene descripcion",
        style: TextStyle(
            color: Colors.black38,
            fontSize: SizeConfig.blockSizeHorizontal! * 6),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
