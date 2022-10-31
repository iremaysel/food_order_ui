import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../payments/presentation/bloc/cart_bloc.dart';

import '../../../../core/constantes/constantes.dart';
import '../../../../core/shared/entities/product.dart';
import '../bloc/bloc/favorites_bloc/favorites_bloc.dart';
import '../pages/food_detail_page/food_detail_view.dart';
import '../pages/home_page/components/colors.dart';
import '../pages/home_page/components/size_config.dart';

class CustomFoodCard extends StatelessWidget {
  const CustomFoodCard({
    Key? key,
    required this.product,
    this.isWishList = false,
  }) : super(key: key);

  final Product product;
  final bool isWishList;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FoodDetailView(food: product)));
      },
      child: Stack(
        fit: StackFit.loose,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal! * 3,
              vertical: SizeConfig.blockSizeVertical! * 1,
            ),
            height: SizeConfig.blockSizeVertical! * 30.5,
            width: SizeConfig.blockSizeHorizontal! * 38,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(SizeConfig.blockSizeHorizontal! * 4),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 3),
                    blurRadius: 6,
                    color: Colors.black.withOpacity(0.3),
                  )
                ]),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        height: SizeConfig.blockSizeVertical! * 13,
                        width: SizeConfig.blockSizeHorizontal! * 38,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                  SizeConfig.blockSizeHorizontal! * 4),
                              topRight: Radius.circular(
                                  SizeConfig.blockSizeHorizontal! * 4)),
                        ),
                        child: product.img == 'no-image.png'
                            ? ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                        SizeConfig.blockSizeHorizontal! * 4),
                                    topRight: Radius.circular(
                                        SizeConfig.blockSizeHorizontal! * 4)),
                                child: Image.asset(
                                  'assets/main/no_image.jpeg',
                                  fit: BoxFit.cover,
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                        SizeConfig.blockSizeHorizontal! * 4),
                                    topRight: Radius.circular(
                                        SizeConfig.blockSizeHorizontal! * 4)),
                                child: FadeInImage(
                                  fit: BoxFit.fill,
                                  placeholder: const AssetImage(
                                      'assets/main/loading.gif'),
                                  image: NetworkImage(
                                    '$apiUrl/uploads/products/${product.uid}',
                                  ),
                                ),
                              )),
                    Padding(
                      padding:
                          EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 2),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: SizeConfig.blockSizeVertical! * 2.6,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              product.categories,
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: SizeConfig.blockSizeVertical! * 2,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                isWishList == true
                    ? Positioned(
                        right: SizeConfig.blockSizeHorizontal! * 1,
                        top: SizeConfig.blockSizeVertical! * 0.5,
                        child: GestureDetector(
                          onTap: () => BlocProvider.of<FavoritesBloc>(context)
                              .add(RemovedProductToFavoritesEvent(product)),
                          child: Icon(
                            Icons.delete_forever_sharp,
                            color: buttonColor,
                          ),
                        ))
                    : Container(),
                Positioned(
                  bottom: SizeConfig.blockSizeVertical! * 1,
                  left: SizeConfig.blockSizeHorizontal! * 2.5,
                  child: Text(
                    "\$${product.price}",
                    style: TextStyle(
                        color: buttonColor,
                        fontSize: SizeConfig.blockSizeVertical! * 2.3,

                        /// 18
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: SizeConfig.blockSizeVertical! * 6,
                    width: SizeConfig.blockSizeHorizontal! * 12,
                    decoration: BoxDecoration(
                        color: buttonColor,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(
                              SizeConfig.blockSizeHorizontal! * 4),
                          topLeft: Radius.circular(
                              SizeConfig.blockSizeHorizontal! * 6),
                        )),
                    child: GestureDetector(
                      onTap: () {
                        BlocProvider.of<CartBloc>(context)
                            .add(AddedProductToCartEvent(product));
                      },
                      child: const Icon(
                        Icons.shopping_cart_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
