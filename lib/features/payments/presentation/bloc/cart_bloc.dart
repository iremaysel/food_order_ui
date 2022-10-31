import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/shared/entities/product.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<AddedProductToCartEvent>(_onAddProductToCartEventToState);
    on<RemovedProductToCartEvent>(_onRemoveProductToCartEventToState);
  }
  final List<Product> _cartListProducts = [];

  FutureOr<void> _onAddProductToCartEventToState(
      AddedProductToCartEvent event, Emitter<CartState> emit) {
    emit(CartLoadingState());
    try {
      _cartListProducts.add(event.product);
      emit(CartLoadedState(_cartListProducts));
    } catch (e) {
      emit(const CartErrorState('Error al adicionar el producto al carrito'));
    }
  }

  FutureOr<void> _onRemoveProductToCartEventToState(
      RemovedProductToCartEvent event, Emitter<CartState> emit) {
    emit(CartLoadingState());
    try {
      _cartListProducts.remove(event.product);
      emit(CartLoadedState(_cartListProducts));
    } catch (e) {
      emit(const CartErrorState('Error al eliminar el producto del carrito'));
    }
  }
}
