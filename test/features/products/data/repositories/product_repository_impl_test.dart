import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_order_ui/core/error/exeptions.dart';
import 'package:food_order_ui/core/error/failure.dart';
import 'package:food_order_ui/core/platform/network_info.dart';
import 'package:food_order_ui/features/products/data/datasources/product_remote_datasource.dart';
import 'package:food_order_ui/features/products/data/models/product_model.dart';
import 'package:food_order_ui/features/products/data/repositories/product_repository_imp.dart';
import 'package:food_order_ui/features/products/domain/entities/product.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'product_repository_impl_test.mocks.dart';

class FakeProductRemoteDataSource extends Mock
    implements ProductRemoteDataSource {}

class FakeNetworkInfo extends Mock implements NetworkInfo {}

@GenerateMocks([FakeProductRemoteDataSource])
@GenerateMocks([FakeNetworkInfo])
void main() {
  late ProductRepositoryImpl productRepositoryImpl;
  late MockFakeProductRemoteDataSource mockFakeProductRemoteDataSource;
  late MockFakeNetworkInfo mockFakeNetworkInfo;

  setUpAll(() {
    mockFakeProductRemoteDataSource = MockFakeProductRemoteDataSource();
    mockFakeNetworkInfo = MockFakeNetworkInfo();

    productRepositoryImpl = ProductRepositoryImpl(
      remoteDataSource: mockFakeProductRemoteDataSource,
      networkInfo: mockFakeNetworkInfo,
    );
  });

  group('GetAllProducts', () {
    const tProductModel = ProductModel(
      name: 'Producto 2',
      categories: 'Bebidas',
      available: true,
      rating: 2,
      description: 'Este producto no tiene descripción',
      quantity: 2,
      price: 100,
      img: "bc507322-47e5-4c50-b4ec-762c5f84d21e.png",
      calories: "",
      uid: '62d6f062a6a2d738a753302c',
    );

    const Product tProduct = tProductModel;

    final List<Product> tProductList = [tProduct];

    test('should check if the device has internet connection', () async {
      //assert
      when(mockFakeNetworkInfo.isConnected).thenAnswer((_) async => true);

      when(mockFakeProductRemoteDataSource.getAllProducts())
          .thenAnswer((_) async => []);

      //act
      productRepositoryImpl.getAllProducts();
      //aserts
      verify(mockFakeNetworkInfo.isConnected);
    });

    test('should check if the device has no internet connection', () async {
      //assert
      when(mockFakeNetworkInfo.isConnected).thenAnswer((_) async => false);

      when(mockFakeProductRemoteDataSource.getAllProducts())
          .thenAnswer((_) async => []);

      //act
      productRepositoryImpl.getAllProducts();
      //verify

      verify(mockFakeNetworkInfo.isConnected);
    });

    group('device has internet', () {
      setUp(() {
        when(mockFakeNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
          'should Remote Data when the call to remote data source is successfull',
          () async {
        when(mockFakeProductRemoteDataSource.getAllProducts())
            .thenAnswer((_) async => tProductList);

        final result = await productRepositoryImpl.getAllProducts();

        verify(mockFakeProductRemoteDataSource.getAllProducts());

        expect(result, Right(tProductList));
      });

      test(
          'should return Server Error when the call to remote data source is successfull ',
          () async {
        when(mockFakeProductRemoteDataSource.getAllProducts())
            .thenThrow(ServerExeption());

        final result = await productRepositoryImpl.getAllProducts();

        verify(mockFakeProductRemoteDataSource.getAllProducts());

        expect(result, const Left(ServerFailure(properties: [])));
      });
    });

    group('device is offline', () {
      setUp(() {
        when(mockFakeNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test('should return No Internet Error when device is offline', () async {
        when(mockFakeProductRemoteDataSource.getAllProducts())
            .thenThrow(NoInternetExeption());

        final result = await productRepositoryImpl.getAllProducts();

        expect(result, const Left(NoInternetFailure(properties: [])));
      });
    });
  });
}
