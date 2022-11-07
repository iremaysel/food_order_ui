import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../repositories/cart_repository.dart';

class GetDeliveryFeeUseCase {
  late final CartRepository repository;

  Future<Either<Failure, double>> call(double subtotal) async {
    return await repository.deliveryFee(subtotal);
  }
}
