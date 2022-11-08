import 'package:dartz/dartz.dart';
import 'package:food_order_ui/features/products/domain/entities/category.dart';
import 'package:food_order_ui/features/products/domain/repositories/category_repository.dart';

import '../../../../../core/error/failure.dart';

class CreateCategoryUseCase {
  final CategoryRepository repository;

  CreateCategoryUseCase(this.repository);

  Future<Either<Failure, Category>> call(Category cat) async {
    return await repository.createCategory(cat);
  }
}
