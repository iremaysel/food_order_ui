import 'package:dartz/dartz.dart';
import 'package:food_order_ui/core/error/failure.dart';
import 'package:food_order_ui/core/shared/entities/product.dart';

abstract class ProductSearchRepository {
  Future<Either<Failure, List<Product>>> searchProducts(
      {required String query, List<Product>? productList});
}
