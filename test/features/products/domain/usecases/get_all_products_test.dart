import 'package:dartz/dartz.dart';

import 'package:food_order_ui/core/shared/entities/product.dart';
import 'package:food_order_ui/features/products/domain/repositories/product_repository.dart';
import 'package:food_order_ui/features/products/domain/usecases/products/get_all_products_usecase.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'get_all_products_test.mocks.dart';

class MProductRepository extends Mock implements ProductRepository {}

@GenerateMocks([MProductRepository])
void main() {
  MockMProductRepository? mockProductRepository;
  GetAllProductsUseCase? useCase;

  setUp(() {
    mockProductRepository = MockMProductRepository();
    useCase = GetAllProductsUseCase(mockProductRepository!);
  });

  final List<Product> products = [
    const Product(
        name: 'Agua Natural',
        categories: 'Bebidas',
        available: true,
        description: 'description',
        quantity: 1,
        price: 100,
        uid: '62d6f062a6a2d738a753302c'),
  ];

  test('should get all Products from the repository', () async {
    //arrange
    when(mockProductRepository!.getAllProducts())
        .thenAnswer((_) async => Right(products));
    //act
    final result = await useCase!();

    expect(result, Right(products));
    verify(mockProductRepository!.getAllProducts());
    verifyNoMoreInteractions(mockProductRepository);
  });
}
