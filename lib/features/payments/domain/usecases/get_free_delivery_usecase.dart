import 'package:dartz/dartz.dart';
import 'package:food_order_ui/features/payments/domain/repositories/cart_repository.dart';

import '../../../../core/error/failure.dart';

class GetFreeDeliveryUseCase {
  final CartRepository repository;

  GetFreeDeliveryUseCase(this.repository);

  Future<Either<Failure, String>> call(double subtotal) async {
    return await repository.freeDelivery(subtotal);
  }
}
