import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../../core/shared/entities/product.dart';
import '../../../../domain/usecases/get_all_favorite_products_form_DB.dart';

import '../../../../domain/usecases/remove_favorite_product_from_DB.dart';
import '../../../../domain/usecases/save_product_favorites_into_db.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final GetAllFavoriteProductsFromDBUseCase getAllFavoriteProductsFromDBUseCase;
  final SaveProductFavoriteIntoDBUseCase saveProductFavoriteIntoDBUseCase;
  final RemoveFavoriteProductFromDBUseCase removeFavoriteProductFromDBUseCase;

  FavoritesBloc({
    required this.getAllFavoriteProductsFromDBUseCase,
    required this.saveProductFavoriteIntoDBUseCase,
    required this.removeFavoriteProductFromDBUseCase,
  }) : super(FavoritesInitialState()) {
    on<StartProductToFavoritesEvent>(_mapStartFavoriteEventToState);
    on<AddedProductToFavoritesEvent>(_onAddToFavoriteEventToState);
    on<RemovedProductToFavoritesEvent>(_onRemoveToFavoriteEventToState);
  }
  List<Product> favoriteList = [];

  FutureOr<void> _mapStartFavoriteEventToState(
      StartProductToFavoritesEvent event, Emitter<FavoritesState> emit) async {
    emit(FavoritesLoadingState());
    try {
      var eitherProductList = await getAllFavoriteProductsFromDBUseCase();

      eitherProductList
          .fold((failure) => emit(const FavoritesErrorState('Server Error')),
              (producList) {
        for (var i = 0; i < event.listProduct.length; i++) {
          for (var j = 0; j < producList.length; j++) {
            if (event.listProduct[i].id == producList[j].id) {
              favoriteList.add(event.listProduct[i]);
              saveProductFavoriteIntoDBUseCase(event.listProduct[i]);
            }
          }
        }

        emit(FavoritesLoadedState(favoriteList));
      });
    } catch (_) {
      emit(const FavoritesErrorState('Server Error'));
    }
  }

  FutureOr<void> _onAddToFavoriteEventToState(
      AddedProductToFavoritesEvent event, Emitter<FavoritesState> emit) async {
    emit(FavoritesLoadingState());

    try {
      if (!favoriteList.contains(event.product)) {
        favoriteList.add(event.product);
      }

      var eitherProductList =
          await saveProductFavoriteIntoDBUseCase.call(event.product);

      eitherProductList.fold(
          (failure) => emit(
              const FavoritesErrorState('No c pudo adicionar el producto')),
          (product) => emit(FavoritesLoadedState(favoriteList)));
      // await addFavoriteListToSharedP(event.product);

    } catch (_) {
      emit(const FavoritesErrorState('No se adiciono el producto..'));
    }
  }

  FutureOr<void> _onRemoveToFavoriteEventToState(
      RemovedProductToFavoritesEvent event,
      Emitter<FavoritesState> emit) async {
    try {
      emit(FavoritesLoadingState());

      favoriteList.remove(event.product);
      var eitherProductList =
          await removeFavoriteProductFromDBUseCase(event.product);

      eitherProductList.fold(
          (failure) => emit(
                const FavoritesErrorState(
                    'Ha Ocurrido algun error cuando se eliminaba el producto'),
              ),
          (prduct) => emit(FavoritesLoadedState(favoriteList)));
    } catch (_) {
      emit(const FavoritesErrorState('No se elimino el producto..'));
    }
  }
}
