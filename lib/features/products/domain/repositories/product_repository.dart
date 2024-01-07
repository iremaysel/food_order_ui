import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/shared/entities/product.dart';
import '../../data/models/category_model.dart';

typedef GetAllProductsFuture = Future<Either<Failure, List<Product>>>;
typedef GetProductsByCategoryFuture = Future<Either<Failure, List<Product>>>;
typedef GetAllFavoriteProductsFromDBFuture
    = Future<Either<Failure, List<Product>>>;
typedef GetAllFiveStartRatingProductsFuture
    = Future<Either<Failure, List<Product>>>;
typedef ProductOrFailureFuture = Future<Either<Failure, Product>>;

abstract class ProductRepository {
  GetAllProductsFuture getAllProducts();

  GetProductsByCategoryFuture getProductsByCategory(CategoryModel cat);

  GetAllFavoriteProductsFromDBFuture getAllFavoriteProductsFromDB();

  GetAllFiveStartRatingProductsFuture getAllFiveStartRatingProducts();

  ProductOrFailureFuture getProductById(String id);

  ProductOrFailureFuture createProduct(Product product);

  ProductOrFailureFuture saveProductFavoriteIntoDB(Product product);

  ProductOrFailureFuture removeProductFavoriteIntoDB(Product product);
}
