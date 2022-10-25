import 'package:dartz/dartz.dart';
import 'package:food_order_ui/core/error/failure.dart';
import 'package:food_order_ui/features/products/domain/entities/product.dart';
import 'package:food_order_ui/features/products/domain/repositories/product_repository.dart';

class CreateProductUseCase {
  final ProductRepository repository;

  CreateProductUseCase(this.repository);

  Future<Either<Failure, Product>> call() async {
    throw UnimplementedError();
  }
}
