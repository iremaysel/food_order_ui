import 'package:dartz/dartz.dart';
import 'package:food_order_ui/features/products/domain/repositories/product_repository.dart';

import '../../../../core/error/failure.dart';
import '../entities/product.dart';

class GetAllFavoriteProductsFromDBUseCase {
  final ProductRepository repository;

  GetAllFavoriteProductsFromDBUseCase(this.repository);

  Future<Either<Failure, List<Product>>> call() async {
    return await repository.getAllFavoriteProductsFromDB();
  }
}
