import 'package:dartz/dartz.dart';
import '../../repositories/product_repository.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/shared/entities/product.dart';

class GetAllFavoriteProductsFromDBUseCase {
  final ProductRepository repository;

  GetAllFavoriteProductsFromDBUseCase(this.repository);

  Future<Either<Failure, List<Product>>> call() async {
    return await repository.getAllFavoriteProductsFromDB();
  }
}
