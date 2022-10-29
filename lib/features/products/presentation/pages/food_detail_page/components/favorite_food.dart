import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_ui/features/products/presentation/bloc/bloc/favorites_bloc/favorites_bloc.dart';
import '../../../../domain/entities/product.dart';
import '../../home_page/components/size_config.dart';

class FavoriteFood extends StatelessWidget {
  final Product product;
  const FavoriteFood({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var favoriteBloc = BlocProvider.of<FavoritesBloc>(context);
    return IconButton(
      onPressed: () {
        favoriteBloc.add(AddedProductToFavoritesEvent(product));
        var snackbar = const SnackBar(
            content: Text('Adicionado correctamente a la wishList'));
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      },
      icon: const Icon(Icons.favorite),
      color: Colors.grey,
      iconSize: SizeConfig.blockSizeVertical! * 5,
    );
  }
}
