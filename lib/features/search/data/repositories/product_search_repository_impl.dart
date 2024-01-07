import 'package:food_order_ui/core/shared/entities/product.dart';

import 'package:food_order_ui/core/error/failure.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exeptions.dart';
import '../../../../core/platform/network/network_info.dart';
import '../../../products/data/datasources/product_local_data_source.dart';
import '../../../products/data/datasources/product_remote_datasource.dart';
import '../../domain/repositories/product_search_repository.dart';

class ProductSearchRepositoryImpl extends ProductSearchRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ProductSearchRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Product>>> searchProducts(
      {required String query, List<Product>? productList}) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.searchProducts(query));
      } on ServerExeption {
        try {
          return Right(await localDataSource.searchProducts(
              query: query, productList: productList!));
        } on Exception {
          return const Left(ServerFailure(properties: []));
        }
      }
    }

    try {
      return Right(await localDataSource.searchProducts(
          query: query, productList: productList!));
    } on Exception {
      return const Left(ServerFailure(properties: []));
    }
  }
}
