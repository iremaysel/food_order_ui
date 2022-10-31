import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/bloc/favorites_bloc/favorites_bloc.dart';
import '../../home_page/components/colors.dart';
import '../../../../../../core/shared/entities/product.dart';
import '../../../bloc/bloc/favorites_bloc/cubit/fav_icon_cubit.dart';
import '../../home_page/components/size_config.dart';

class FavoriteFood extends StatelessWidget {
  final Product product;
  const FavoriteFood({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (context) => FavIconCubit(),
      child: FavoriteFoodBody(product: product),
    );
  }
}

class FavoriteFoodBody extends StatelessWidget {
  const FavoriteFoodBody({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    var favoriteBloc = BlocProvider.of<FavoritesBloc>(context);
    var favIconCubit = BlocProvider.of<FavIconCubit>(context);

    favIconCubit.checkIsfavorite(
        product: product, listProduct: favoriteBloc.favoriteList);

    return Builder(builder: (context) {
      final state = context.watch<FavoritesBloc>().state;

      if (state is FavoritesLoadedState) {
        favIconCubit.checkIsfavorite(
            product: product, listProduct: state.productList);
      }
      return BlocBuilder<FavIconCubit, FavIconState>(
        builder: (context, state) {
          if (state is IsNotFavorite) {
            return IconButton(
              onPressed: () {
                favoriteBloc.add(AddedProductToFavoritesEvent(product));
                var snackbar = const SnackBar(
                    content: Text('Adicionado correctamente a la wishList'));
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
                favIconCubit.addFavoriteEvent();
              },
              icon: const Icon(Icons.favorite_border),
              color: buttonColor,
              iconSize: SizeConfig.blockSizeVertical! * 5,
            );
          } else {
            return IconButton(
              onPressed: () {
                favoriteBloc.add(RemovedProductToFavoritesEvent(product));
                var snackbar = const SnackBar(
                    content: Text('Eliminado correctamente de la wishList'));
                ScaffoldMessenger.of(context).showSnackBar(snackbar);

                favIconCubit.deleteFavoriteEvent();
              },
              icon: const Icon(Icons.favorite),
              color: buttonColor,
              iconSize: SizeConfig.blockSizeVertical! * 5,
            );
          }
        },
      );
    });
  }
}
