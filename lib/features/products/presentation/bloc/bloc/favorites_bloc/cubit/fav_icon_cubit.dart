import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../../core/shared/entities/product.dart';

part 'fav_icon_state.dart';

class FavIconCubit extends Cubit<FavIconState> {
  FavIconCubit() : super(const IsNotFavorite(true));

  void checkIsfavorite(
      {required Product product, required List<Product> listProduct}) {
    if (listProduct.contains(product)) {
      emit(const IsFavoriteIcon(true));
    } else {
      const IsNotFavorite(true);
    }
  }

  void addFavoriteEvent() {
    emit(const IsFavoriteIcon(true));
  }

  void deleteFavoriteEvent() {
    emit(const IsNotFavorite(true));
  }
}
