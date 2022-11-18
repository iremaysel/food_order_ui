import 'package:food_order_ui/features/products/data/datasources/category_remote_data_source.dart';
import 'package:food_order_ui/features/products/domain/entities/category.dart';
import 'package:food_order_ui/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:food_order_ui/features/products/domain/repositories/category_repository.dart';

import '../../../../core/platform/network/network_info.dart';
import '../models/category_model.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  CategoryRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, Category>> createCategory(CategoryModel cat) async {
    try {
      if (await networkInfo.isConnected) {
        return Right(await remoteDataSource.createCategory(cat));
      } else {
        return const Left(ServerFailure(properties: []));
      }
    } catch (e) {
      return const Left(ServerFailure(properties: []));
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    try {
      if (await networkInfo.isConnected) {
        return Right(await remoteDataSource.getCategories());
      } else {
        return const Left(ServerFailure(properties: []));
      }
    } catch (e) {
      return const Left(ServerFailure(properties: []));
    }
  }

  @override
  Future<Either<Failure, Category>> getCategoryById(String catId) async {
    try {
      if (await networkInfo.isConnected) {
        return Right(await remoteDataSource.getCategoryById(catId));
      } else {
        return const Left(ServerFailure(properties: []));
      }
    } catch (e) {
      return const Left(ServerFailure(properties: []));
    }
  }

  @override
  Future<Either<Failure, Category>> removeCategory(CategoryModel cat) async {
    try {
      if (await networkInfo.isConnected) {
        return Right(await remoteDataSource.removeCategory(cat));
      } else {
        return const Left(ServerFailure(properties: []));
      }
    } catch (e) {
      return const Left(ServerFailure(properties: []));
    }
  }

  @override
  Future<Either<Failure, Category>> updateCategory(CategoryModel cat) async {
    try {
      if (await networkInfo.isConnected) {
        return Right(await remoteDataSource.updateCategory(cat));
      } else {
        return const Left(ServerFailure(properties: []));
      }
    } catch (e) {
      return const Left(ServerFailure(properties: []));
    }
  }
}
