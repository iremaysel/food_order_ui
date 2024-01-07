import 'package:food_order_ui/core/shared/entities/product.dart';
import 'package:food_order_ui/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:food_order_ui/features/payments/domain/repositories/cart_repository.dart';

class CartRepositoryImpl extends CartRepository {
  @override
  Future<Either<Failure, double>> deliveryFee(double subtotal) async {
    try {
      if (subtotal >= 500) {
        return const Right(0.0);
      } else {
        return const Right(50.0);
      }
    } on Exception {
      return const Left(CartFailure(properties: []));
    }
  }

  @override
  Future<Either<Failure, String>> freeDelivery(double subtotal) async {
    try {
      if (subtotal >= 500) {
        return const Right('Entrega Gratis');
      } else {
        double missing = 30.0 - subtotal;
        return Right('\$${missing.toString()} para entrega gratis');
      }
    } on Exception {
      return const Left(CartFailure(properties: []));
    }
  }

  @override
  Future<Either<Failure, Map<Product, int>>> productQuantity(
      List<Product> products) async {
    try {
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
      return Right(quantity);
    } on Exception {
      return const Left(CartFailure(properties: []));
    }
  }

  @override
  Future<Either<Failure, double>> total(
      {required double subtotal, required double deliveryFee}) async {
    return Right(subtotal + deliveryFee);
  }
}
