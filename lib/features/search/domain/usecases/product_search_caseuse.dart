import 'package:dartz/dartz.dart';
import 'package:food_order_ui/features/search/domain/repositories/product_search_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/shared/entities/product.dart';

class ProductSearchUseCase {
  final ProductSearchRepository repository;

  ProductSearchUseCase(this.repository);

  Future<Either<Failure, List<Product>>> call(
      {required String query, List<Product>? products}) async {
    return await repository.searchProducts(query: query , productList: products);
  }
}
