import '../../domain/entities/product.dart';

abstract class ProductRemoteDataSource {
  Future<List<Product>> getAllProducts();

  Future<Product> getProductById(String id);
}
