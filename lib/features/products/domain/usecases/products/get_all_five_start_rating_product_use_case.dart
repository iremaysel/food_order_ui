import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/shared/entities/product.dart';
import '../../repositories/product_repository.dart';

class GetAllFiveStartRatingProductsUseCase {
  final ProductRepository repository;

  const GetAllFiveStartRatingProductsUseCase(this.repository);

  Future<Either<Failure, List<Product>>> call() async {
    return await repository.getAllFiveStartRatingProducts();
  }
}
