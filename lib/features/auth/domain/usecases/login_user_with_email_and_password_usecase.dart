import 'package:dartz/dartz.dart';
import 'package:food_order_ui/features/auth/domain/repositories/auth_user_repository.dart';

import '../../../../core/error/failure.dart';
import '../entities/user.dart';

class LoginUserWithEmailAndPasswordUsecase {
  final AuthUserRepository authUserRepository;

  LoginUserWithEmailAndPasswordUsecase(this.authUserRepository);

  Future<Either<Failure, User>> call(
      {required String email, required String password}) async {
    return await authUserRepository.loginUserWithEmailAndPassword(
        email: email, password: password);
  }
}
