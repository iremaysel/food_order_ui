import 'package:dartz/dartz.dart';
import 'package:food_order_ui/core/error/failure.dart';

import '../../data/models/category_model.dart';
import '../entities/category.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<Category>>> getCategories();
  Future<Either<Failure, Category>> createCategory(CategoryModel cat);
  Future<Either<Failure, Category>> getCategoryById(String catId);
  Future<Either<Failure, Category>> updateCategory(CategoryModel cat);
  Future<Either<Failure, Category>> removeCategory(CategoryModel cat);
}
