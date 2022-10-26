import 'package:food_order_ui/core/error/exeptions.dart';
import 'package:food_order_ui/core/platform/network/network_info.dart';
import 'package:food_order_ui/features/products/data/datasources/product_remote_datasource.dart';
import 'package:food_order_ui/features/products/domain/entities/product.dart';
import 'package:food_order_ui/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:food_order_ui/features/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.getAllProducts());
      } on ServerExeption {
        return const Left(ServerFailure(properties: []));
      }
    } else {
      return const Left(NoInternetFailure(properties: []));
    }
  }

  @override
  Future<Either<Failure, Product>> getProductById(String id) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.getProductById(id));
      } on ServerExeption {
        return const Left(ServerFailure(properties: []));
      }
    } else {
      return const Left(NoInternetFailure(properties: []));
    }
  }

  @override
  Future<Either<Failure, Product>> createProduct() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.createProduct());
      } on ServerExeption {
        return const Left(ServerFailure(properties: []));
      }
    } else {
      return const Left(NoInternetFailure(properties: []));
    }
  }
}
