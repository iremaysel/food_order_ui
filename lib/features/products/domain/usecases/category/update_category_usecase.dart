import 'package:dartz/dartz.dart';
import 'package:food_order_ui/features/products/domain/repositories/category_repository.dart';

import '../../../../../core/error/failure.dart';
import '../../../data/models/category_model.dart';
import '../../entities/category.dart';

class UpdateCategoryUseCase {
  final CategoryRepository repository;

  UpdateCategoryUseCase(this.repository);

  Future<Either<Failure, Category>> call(CategoryModel cat) async {
    return await repository.updateCategory(cat);
  }
}
