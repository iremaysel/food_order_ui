import 'package:dartz/dartz.dart';
import 'package:food_order_ui/core/error/failure.dart';

import '../../../../core/shared/entities/product.dart';

abstract class CartRepository {
  Future<Either<Failure, double>> total(
      {required double subtotal, required double deliveryFee});
  Future<Either<Failure, double>> deliveryFee(double subtotal);
  Future<Either<Failure, String>> freeDelivery(double subtotal);
  Future<Either<Failure, Map<Product, int>>> productQuantity(
      List<Product> products);
}
