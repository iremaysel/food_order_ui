import 'package:equatable/equatable.dart';
import 'package:food_order_ui/core/shared/entities/product.dart';

class Cart extends Equatable {
  final List<Product> product;

  
  double get subtotal => product.fold(0, (total, current) {
        if (current.price != null) {
          return total + current.price!;
        } else {
          return total + 0;
        }
      });

  const Cart({required this.product});

  double deliveryFee(double subtotal) {
    if (subtotal >= 500) {
      return 0.0;
    } else {
      return 10;
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
  @override
  List<Object?> get props => [
        product,
      ];
}
