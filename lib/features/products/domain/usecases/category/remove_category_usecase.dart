import 'package:dartz/dartz.dart';
import 'package:food_order_ui/features/products/domain/repositories/category_repository.dart';

import '../../../../../core/error/failure.dart';
import '../../entities/category.dart';

class RemoveCategoryUseCase {
  final CategoryRepository repository;

  RemoveCategoryUseCase(this.repository);

  Future<Either<Failure, Category>> call(Category cat) async {
    return await repository.removeCategory(cat);
  }
}
