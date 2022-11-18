import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/shared/entities/product.dart';
import '../../data/models/category_model.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getAllProducts();
  Future<Either<Failure, List<Product>>> getProductsByCategory(
      CategoryModel cat);
  Future<Either<Failure, List<Product>>> getAllFavoriteProductsFromDB();
  Future<Either<Failure, List<Product>>> getAllFiveStartRatingProducts();
  Future<Either<Failure, Product>> getProductById(String id);
  Future<Either<Failure, Product>> createProduct(Product product);
  Future<Either<Failure, Product>> saveProductFavoriteIntoDB(Product product);
  Future<Either<Failure, Product>> removeProductFavoriteIntoDB(Product product);
}
