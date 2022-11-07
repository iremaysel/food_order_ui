part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoadingState extends CartState {}

class CartLoadedState extends CartState {
  final Cart cart;

  const CartLoadedState(this.cart);
  @override
  List<Object> get props => [cart];
}

class CartErrorState extends CartState {
  final String message;

  const CartErrorState(this.message);
  @override
  List<Object> get props => [message];
}
