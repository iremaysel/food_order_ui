import 'package:food_order_ui/core/shared/entities/product.dart';
import 'package:food_order_ui/features/products/domain/repositories/product_repository.dart';
import 'package:food_order_ui/features/products/domain/usecases/products/create_product_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'get_product_by_id_test.mocks.dart';

class MProductRepository extends Mock implements ProductRepository {}

@GenerateMocks([MProductRepository])
void main() {
  late MockFakeProductRepository mockFakeProductRepository;
  late CreateProductUseCase useCase;

  setUp(() {
    mockFakeProductRepository = MockFakeProductRepository();
    useCase = CreateProductUseCase(mockFakeProductRepository);
  });

  const Product product = Product(
      name: 'Malta Turbo',
      categories: 'Bebidas',
      available: true,
      description: 'Este producto no tiene descripción',
      price: 180,
      id: '6357f9cf09b60afb2d79861b',
      img: 'no-image.png');

  test('Should Create a product From the Product Repository', () {
    /// -- [Assert - Inicializacion]
  });
}
