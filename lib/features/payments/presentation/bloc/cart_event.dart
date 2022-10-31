part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddedProductToCartEvent extends CartEvent {
  final Product product;

  const AddedProductToCartEvent(this.product);
  @override
  List<Object> get props => [product];
}

class RemovedProductToCartEvent extends CartEvent {
  final Product product;

  const RemovedProductToCartEvent(this.product);
  @override
  List<Object> get props => [product];
}
