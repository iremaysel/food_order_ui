import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../repositories/cart_repository.dart';

class GetTotalUseCase {
  final CartRepository repository;

  GetTotalUseCase(this.repository);

  Future<Either<Failure, double>> call(
      {required double subtotal, required double deliveryFee}) async {
    return await repository.total(deliveryFee: deliveryFee, subtotal: subtotal);
  }
}
