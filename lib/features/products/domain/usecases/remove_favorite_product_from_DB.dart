import 'package:dartz/dartz.dart';
import '../repositories/product_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/shared/entities/product.dart';

class RemoveFavoriteProductFromDBUseCase {
  final ProductRepository repository;

  RemoveFavoriteProductFromDBUseCase(this.repository);

  Future<Either<Failure, Product>> call(Product product) async {
    return await repository.removeProductFavoriteIntoDB(product);
  }
}
