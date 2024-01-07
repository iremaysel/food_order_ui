import 'package:dartz/dartz.dart';
import 'package:food_order_ui/core/error/failure.dart';
import 'package:food_order_ui/core/shared/entities/product.dart';
import 'package:food_order_ui/features/products/data/models/category_model.dart';
import 'package:food_order_ui/features/products/domain/repositories/product_repository.dart';

class GetProductsByCategoryUseCase {
  final ProductRepository repository;

  GetProductsByCategoryUseCase(this.repository);

  Future<Either<Failure, List<Product>>> call(CategoryModel cat) async {
    return await repository.getProductsByCategory(cat);
  }
}
