import 'package:food_order_ui/core/error/exeptions.dart';
import 'package:food_order_ui/features/auth/data/datasource/user_remote_data_source.dart';
import 'package:food_order_ui/features/auth/domain/entities/user.dart';

import 'package:food_order_ui/core/error/failure.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/platform/network/network_info.dart';
import '../../domain/repositories/auth_user_repository.dart';

class AuthUserRepositoryImpl extends AuthUserRepository {
  final UserRemoteDataSource userRemoteDataSource;
  final NetworkInfo networkInfo;

  AuthUserRepositoryImpl(
      {required this.networkInfo, required this.userRemoteDataSource});

  @override
  Future<Either<Failure, User>> loginUserWithEmailAndPassword(
      {required String email, required String password}) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await userRemoteDataSource.loginUserWithEmailAndPassword(
            email: email, password: password));
      } on ServerExeption {
        return const Left(ServerFailure(properties: []));
      } on UnauthorizedExeption {
        return const Left(UnauthorizedFailure(properties: []));
      } on BadRequestExeption catch (e) {
        return Left(
            BadRequestFailure(properties: [e.message], meesageFailure: ''));
      }
    } else {
      return const Left(NoInternetFailure(properties: []));
    }
  }

  @override
  Future<Either<Failure, User>> registerUserWithEmailAndPassword(
      {required String fullName,
      required String email,
      required String password}) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(
            await userRemoteDataSource.registerUserWithEmailAndPassword(
                fullName: fullName, email: email, password: password));
      } on ServerExeption {
        return const Left(ServerFailure(properties: []));
      } on BadRequestExeption catch (e) {
        return Left(
            BadRequestFailure(properties: const [], meesageFailure: e.message));
      }
    } else {
      return const Left(NoInternetFailure(properties: []));
    }
  }
}
