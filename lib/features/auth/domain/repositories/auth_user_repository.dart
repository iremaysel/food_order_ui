import 'package:dartz/dartz.dart';
import 'package:food_order_ui/core/error/failure.dart';
import 'package:food_order_ui/features/auth/domain/entities/user.dart';

abstract class AuthUserRepository {
  Future<Either<Failure, User>> loginUserWithEmailAndPassword(
      {required String email, required String password});

  /////////////////////
  Future<Either<Failure, User>> registerUserWithEmailAndPassword(
      {required String fullName,
      required String email,
      required String password});
}
