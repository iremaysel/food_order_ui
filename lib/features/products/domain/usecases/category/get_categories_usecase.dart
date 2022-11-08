import 'package:dartz/dartz.dart';
import 'package:food_order_ui/features/products/domain/repositories/category_repository.dart';

import '../../../../../core/error/failure.dart';

import '../../entities/category.dart';

class GetCategoriesUseCase {
  final CategoryRepository repository;

  GetCategoriesUseCase(this.repository);

  Future<Either<Failure, List<Category>>> call() async {
    return await repository.getCategories();
  }
}
