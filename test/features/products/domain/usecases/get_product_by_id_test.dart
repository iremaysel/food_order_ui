import 'package:dartz/dartz.dart';

import 'package:food_order_ui/core/shared/entities/product.dart';
import 'package:food_order_ui/features/products/domain/repositories/product_repository.dart';
import 'package:food_order_ui/features/products/domain/usecases/products/get_product_by_id_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'get_product_by_id_test.mocks.dart';

class FakeProductRepository extends Mock implements ProductRepository {}

@GenerateMocks([FakeProductRepository])
void main() {
  GetProductByIdUseCase? useCase;
  MockFakeProductRepository? mockProductRepository;

  setUpAll(() {
    mockProductRepository = MockFakeProductRepository();
    useCase = GetProductByIdUseCase(mockProductRepository!);
  });
  const String id = '62d6f062a6a2d738a753302c';

  const product = Product(
      name: 'Agua Natural',
      categories: 'Bebidas',
      available: true,
      description: 'Descrip[tiom in here',
      quantity: 2,
      price: 200,
      uid: id);

  test('should get a Product from a repository', () async {
    //assert
    when(mockProductRepository!.getProductById(any))
        .thenAnswer((_) async => const Right(product));
    //act
    final result = await useCase!(id);

    //expect
    expect(result, const Right(product));
    verify(mockProductRepository!.getProductById(id));
    verifyNoMoreInteractions(mockProductRepository!);
  });
}
