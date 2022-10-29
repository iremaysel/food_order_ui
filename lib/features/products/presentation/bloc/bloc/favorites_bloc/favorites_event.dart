part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class StartProductToFavoritesEvent extends FavoritesEvent {}

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
