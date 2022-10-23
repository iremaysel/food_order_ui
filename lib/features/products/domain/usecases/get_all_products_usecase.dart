import 'package:dartz/dartz.dart';
import 'package:food_order_ui/core/error/failure.dart';
import 'package:food_order_ui/features/products/domain/entities/product.dart';
import 'package:food_order_ui/features/products/domain/repositories/product_repository.dart';

class GetAllProductsUseCase {
  final ProductRepository repository;

  GetAllProductsUseCase(this.repository);

  Future<Either<Failure, List<Product>>> call() async {
    return await repository.getAllProducts();
  }
}
