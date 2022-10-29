import '../../../../core/error/exeptions.dart';
import '../../../../core/platform/network/network_info.dart';
import '../datasources/product_remote_datasource.dart';
import '../models/product_model.dart';
import '../../domain/entities/product.dart';
import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repositories/product_repository.dart';

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
  Future<Either<Failure, Product>> createProduct(Product product) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(
            await remoteDataSource.createProduct(product as ProductModel));
      } on ServerExeption {
        return const Left(ServerFailure(properties: []));
      }
    } else {
      return const Left(NoInternetFailure(properties: []));
    }
  }
}
