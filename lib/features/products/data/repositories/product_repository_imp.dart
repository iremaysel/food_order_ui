import 'package:dartz/dartz.dart';
import 'package:food_order_ui/features/products/data/models/category_model.dart';

import '../../../../core/error/exeptions.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/platform/network/network_info.dart';
import '../../../../core/shared/entities/product.dart';
import '../../../../core/shared/models/product_model.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_local_data_source.dart';
import '../datasources/product_remote_datasource.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({
    required this.localDataSource,
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

  @override
  Future<Either<Failure, List<Product>>> getAllFavoriteProductsFromDB() async {
    try {
      return Right(await localDataSource.getAllFavoriteProductsFromDB());
    } on ServerExeption {
      return const Left(ServerFailure(properties: []));
    }
  }

  @override
  Future<Either<Failure, Product>> saveProductFavoriteIntoDB(
      Product product) async {
    try {
      return Right(await localDataSource
          .saveProductFavoriteIntoDB(product as ProductModel));
    } on ServerExeption {
      return const Left(ServerFailure(properties: []));
    }
  }

  @override
  Future<Either<Failure, Product>> removeProductFavoriteIntoDB(
      Product product) async {
    try {
      return Right(await localDataSource
          .removeProductFavoriteIntoDB(product as ProductModel));
    } on ServerExeption {
      return const Left(ServerFailure(properties: []));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getAllFiveStartRatingProducts() async {
    //agregar la comprobacion de si hay o no conexion
    try {
      return Right(await remoteDataSource.getAllFiveStartRatingProducts());
    } on ServerExeption {
      return const Left(ServerFailure(properties: []));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getProductsByCategory(
      CategoryModel cat) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.getProductsByCategory(cat));
      } on ServerExeption {
        return const Left(ServerFailure(properties: []));
      }
    } else {
      return const Left(NoInternetFailure(properties: []));
    }
  }
}
