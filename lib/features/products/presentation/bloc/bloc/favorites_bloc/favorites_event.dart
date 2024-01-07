part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class StartProductToFavoritesEvent extends FavoritesEvent {
  final List<Product> listProduct;

  const StartProductToFavoritesEvent(this.listProduct);

  @override
  List<Object> get props => [listProduct];
}

class AddedProductToFavoritesEvent extends FavoritesEvent {
  final Product product;

  const AddedProductToFavoritesEvent(this.product);

  @override
  List<Object> get props => [product];
}

class RemovedProductToFavoritesEvent extends FavoritesEvent {
  final Product product;

  const RemovedProductToFavoritesEvent(this.product);

  @override
  List<Object> get props => [product];
}
