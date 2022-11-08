import 'package:dartz/dartz.dart';
import 'package:food_order_ui/core/error/failure.dart';

import '../entities/category.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<Category>>> getCategories();
  Future<Either<Failure, Category>> createCategory(Category cat);
  Future<Either<Failure, Category>> getCategoryById(String catId);
  Future<Either<Failure, Category>> updateCategory(Category cat);
  Future<Either<Failure, Category>> removeCategory(Category cat);
}
