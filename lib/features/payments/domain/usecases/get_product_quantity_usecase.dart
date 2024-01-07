import 'package:dartz/dartz.dart';
import 'package:food_order_ui/features/payments/domain/repositories/cart_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/shared/entities/product.dart';

class GetProductQuantityUseCase {
  final CartRepository repository;

  GetProductQuantityUseCase(this.repository);

  Future<Either<Failure, Map<Product, int>>> call(
      List<Product> products) async {
    return await repository.productQuantity(products);
  }
}
