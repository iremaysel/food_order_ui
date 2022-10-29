import 'package:dartz/dartz.dart';

import 'package:food_order_ui/core/error/exeptions.dart';
import 'package:food_order_ui/core/error/failure.dart';
import 'package:food_order_ui/core/platform/network/network_info.dart';
import 'package:food_order_ui/features/products/data/datasources/product_local_data_source.dart';
import 'package:food_order_ui/features/products/data/datasources/product_remote_datasource.dart';
import 'package:food_order_ui/features/products/data/models/product_model.dart';
import 'package:food_order_ui/features/products/data/repositories/product_repository_imp.dart';
import 'package:food_order_ui/features/products/domain/entities/product.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'product_repository_impl_test.mocks.dart';

class FakeProductRemoteDataSource extends Mock
    implements ProductRemoteDataSource {}

class FakeProductLocalDataSource extends Mock
    implements ProductLocalDataSource {}

class FakeNetworkInfo extends Mock implements NetworkInfo {}

@GenerateMocks([FakeProductRemoteDataSource])
@GenerateMocks([FakeProductLocalDataSource])
@GenerateMocks([FakeNetworkInfo])
void main() {
  late ProductRepositoryImpl productRepositoryImpl;
  late MockFakeProductRemoteDataSource mockFakeProductRemoteDataSource;
  late MockFakeProductLocalDataSource mockFakeProductLocalDataSource;
  late MockFakeNetworkInfo mockFakeNetworkInfo;

  setUpAll(() {
    mockFakeProductRemoteDataSource = MockFakeProductRemoteDataSource();
    mockFakeNetworkInfo = MockFakeNetworkInfo();
    mockFakeProductLocalDataSource = MockFakeProductLocalDataSource();

    productRepositoryImpl = ProductRepositoryImpl(
      remoteDataSource: mockFakeProductRemoteDataSource,
      networkInfo: mockFakeNetworkInfo,
      localDataSource: mockFakeProductLocalDataSource,
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
          'should Return Data when the call to remote data source is successfull',
          () async {
        when(mockFakeProductRemoteDataSource.getAllProducts())
            .thenAnswer((_) async => tProductList);

        final result = await productRepositoryImpl.getAllProducts();

        verify(mockFakeProductRemoteDataSource.getAllProducts());

        expect(result, Right(tProductList));
      });

      test(
          'should return Server Error when the call to remote data source is unsuccessfull',
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
        final result = await productRepositoryImpl.getAllProducts();

        expect(result, const Left(NoInternetFailure(properties: [])));
      });
    });
  });

  group('GetProductByID', () {
    const uid = '62d6f062a6a2d738a753302c';
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
      uid: uid,
    );

    const Product tProduct = tProductModel;

    test('should check if the device has internet connection', () async {
      //assert
      when(mockFakeNetworkInfo.isConnected).thenAnswer((_) async => true);

      when(mockFakeProductRemoteDataSource.getProductById(any))
          .thenAnswer((_) async => tProduct);

      //act
      productRepositoryImpl.getProductById(uid);
      //aserts
      verify(mockFakeNetworkInfo.isConnected);
    });

    test('should check if the device has no internet connection', () async {
      //assert
      when(mockFakeNetworkInfo.isConnected).thenAnswer((_) async => false);

      //act
      final result = await productRepositoryImpl.getProductById(uid);
      //verify

      expect(result, const Left(NoInternetFailure(properties: [])));
    });

    group('device has internet', () {
      setUp(() {
        when(mockFakeNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
          'should return Remote Data when the call to remote data source is successfull',
          () async {
        when(mockFakeProductRemoteDataSource.getProductById(any))
            .thenAnswer((_) async => tProduct);

        final result = await productRepositoryImpl.getProductById(uid);

        verify(mockFakeProductRemoteDataSource.getProductById(uid));

        expect(result, const Right(tProduct));
      });

      test(
          'should return Server Error when the call to remote data source is successfull',
          () async {
        when(mockFakeProductRemoteDataSource.getProductById(any))
            .thenThrow(ServerExeption());

        final result = await productRepositoryImpl.getProductById(uid);

        verify(mockFakeProductRemoteDataSource.getProductById(uid));

        expect(result, const Left(ServerFailure(properties: [])));
      });
    });

    group('device is offline', () {
      setUp(() {
        when(mockFakeNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test('should return No Internet Error when device is offline', () async {
        when(mockFakeProductRemoteDataSource.getProductById(any))
            .thenThrow(NoInternetExeption());

        final resutl = await productRepositoryImpl.getProductById(uid);

        expect(resutl, const Left(NoInternetFailure(properties: [])));
      });
    });
  });

  group('CreateProduct', () {
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

    test('should check if the device has internet connection', () async {
      //assert
      when(mockFakeNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockFakeProductRemoteDataSource.createProduct(tProductModel))
          .thenAnswer((_) async => tProductModel);

      //act
      productRepositoryImpl.createProduct(tProductModel);
      //aserts
      verify(mockFakeNetworkInfo.isConnected);
    });
    test('should check if the device has no internet connection', () async {
      //assert
      when(mockFakeNetworkInfo.isConnected).thenAnswer((_) async => false);

      //act
      productRepositoryImpl.createProduct(tProductModel);
      //aserts
      verify(mockFakeNetworkInfo.isConnected);
    });

    group('has internet connection', () {
      setUp(() {
        when(mockFakeNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
          'Sshould Return Data when the call to remote data source is successfull',
          () async {
        when(mockFakeProductRemoteDataSource.createProduct(tProductModel))
            .thenAnswer((_) async => tProductModel);

        final result = await productRepositoryImpl.createProduct(tProductModel);
        verify(mockFakeProductRemoteDataSource.createProduct(tProductModel));

        expect(result, const Right(tProductModel));
      });
      test(
          'Sshould Return Failure when the call to remote data source is unsuccessfull',
          () async {
        when(mockFakeProductRemoteDataSource.createProduct(tProductModel))
            .thenThrow(ServerExeption());

        final result = await productRepositoryImpl.createProduct(tProductModel);
        verify(mockFakeProductRemoteDataSource.createProduct(tProductModel));

        expect(result, const Left(ServerFailure(properties: [])));
      });
    });

    group('has no internet connection', () {
      setUp(() {
        when(mockFakeNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test('Should Return Failure when there is no internet connection',
          () async {
        final result = await productRepositoryImpl.createProduct(tProductModel);

        expect(result, const Left(NoInternetFailure(properties: [])));
      });
    });
  });
}
