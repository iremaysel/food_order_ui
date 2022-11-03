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

  double get subtotal =>
      _cartListProducts.fold(0, (total, current) => total + current.price);

  double deliveryFee(double subtotal) {
    if (subtotal >= 500) {
      return 0.0;
    } else {
      return 50;
    }
  }

  String freeDelivery(double subtotal) {
    if (subtotal >= 500) {
      return 'Entrega Gratis';
    } else {
      double missing = 30.0 - subtotal;
      return '\$${missing.toString()} para entrega gratis';
    }
  }

  Map<Product, int> productQuantity(List<Product> products) {
    Map<Product, int> quantity = {};

    for (var product in products) {
      if (quantity.containsKey(product)) {
        if (quantity[product] != null) {
          quantity[product] = quantity[product]! + 1;
        }
      } else {
        quantity[product] = 1;
      }
    }
    return quantity;
  }

  double total(double subtotal, double deliveryFee) {
    return subtotal + deliveryFee;
  }

  String get totalString => total(subtotal, deliveryFee(subtotal)).toString();

  String get deliveryFeeString => deliveryFee(subtotal).toString();
  String get freeDeliveryString => freeDelivery(subtotal).toString();
  String get subTotalString => subtotal.toString();

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
