import 'package:dartz/dartz.dart';
import 'package:food_order_ui/features/products/domain/repositories/product_repository.dart';

import '../../../../core/error/failure.dart';
import '../entities/product.dart';

class SaveProductFavoriteIntoDBUseCase {
  final ProductRepository repository;

  SaveProductFavoriteIntoDBUseCase(this.repository);

  Future<Either<Failure, Product>> call(Product product) async {
    return await repository.saveProductFavoriteIntoDB(product);
  }
}
