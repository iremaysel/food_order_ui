import 'package:food_order_ui/core/constantes/constantes.dart';
import 'package:food_order_ui/core/error/exeptions.dart';
import 'package:food_order_ui/features/products/data/datasources/product_remote_datasource.dart';
import 'package:food_order_ui/features/products/data/models/product_model.dart';
import 'package:food_order_ui/core/shared/entities/product.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:test/test.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'product_remote_data_source_impl_test.mocks.dart';

class FakeHttpClient extends Mock implements http.Client {}

@GenerateMocks([FakeHttpClient])
void main() {
  late ProductRemoteDataSourceImpl dataSourceImpl;
  late MockFakeHttpClient mockFakeHttpClient;

  setUp(() {
    mockFakeHttpClient = MockFakeHttpClient();
    dataSourceImpl = ProductRemoteDataSourceImpl(client: mockFakeHttpClient);
  });

  void setUpMockHttpClientSuccess200() {
    when(mockFakeHttpClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response(fixture('product.json'), 200));
  }

  void setUpMockHttpClientFails404() {
    when(mockFakeHttpClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response('SomeThing went wrong', 404));
  }

  group('GetProductById', () {
    const String id = '62d6f062a6a2d738a753302c';

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
      uid: id,
    );
    test(
        'should perform a get request on a URL with an id in the empoint and with application/json Header',
        () async {
      setUpMockHttpClientSuccess200();

      dataSourceImpl.getProductById(id);
      Uri uri = Uri.parse('$apiUrl/products/$id');

      verify(mockFakeHttpClient
          .get(uri, headers: {'Content-Type': 'application/json'}));
    });

    test('should return a Product when the response is 200', () async {
      setUpMockHttpClientSuccess200();

      final result = await dataSourceImpl.getProductById(id);

      Uri uri = Uri.parse('$apiUrl/products/$id');
      verify(mockFakeHttpClient
          .get(uri, headers: {'Content-Type': 'application/json'}));

      expect(result, tProductModel);
    });

    test(
        'should return a ServerExeption when the response is 404 or other code ',
        () async {
      setUpMockHttpClientFails404();

      final call = dataSourceImpl.getProductById;

      expect(() => call(id), throwsA(const TypeMatcher<ServerExeption>()));
    });
  });

  group('GetAllProducts', () {
    const tProductModel = ProductModel(
        name: "Agua Natural 500ml",
        categories: "Bebidas",
        available: true,
        rating: 2,
        description: "Este producto no tiene descripción ",
        quantity: 0,
        price: 100,
        img: "fa659adf-f140-4d09-afa9-3c47c7c0bdde.jpeg",
        calories: "",
        uid: "62d6f062a6a2d738a753302c");

    const tProducModel2 = ProductModel(
        name: "Agua Natural 1500ml",
        categories: "Bebidas",
        available: true,
        rating: 1,
        description: "Este producto no tiene descripción ",
        quantity: 0,
        price: 200,
        img: "no-image.png",
        uid: "62d6f089a6a2d738a753302e");

    const Product tProduct = tProductModel;

    final List<Product> tProductList = [tProduct, tProducModel2];

    test(
        'should perform a get request on a URL with an id in the empoint and with application/json Header',
        () async {
      when(mockFakeHttpClient.get(any, headers: anyNamed('headers')))
          .thenAnswer(
              (_) async => http.Response(fixture('product_list.json'), 200));

      dataSourceImpl.getAllProducts();

      Uri uri = Uri.parse('$apiUrl/products/');

      verify(mockFakeHttpClient
          .get(uri, headers: {'Content-Type': 'application/json'}));
    });

    test('should return a List of Products when the response is 200', () async {
      when(mockFakeHttpClient.get(any, headers: anyNamed('headers')))
          .thenAnswer(
              (_) async => http.Response(fixture('product_list.json'), 200));

      final result = await dataSourceImpl.getAllProducts();

      Uri uri = Uri.parse('$apiUrl/products/');
      verify(mockFakeHttpClient
          .get(uri, headers: {'Content-Type': 'application/json'}));

      expect(result, tProductList);
    });

    test(
        'should return a ServerExeption when the response is 404 or other code ',
        () async {
      setUpMockHttpClientFails404();

      final call = dataSourceImpl.getAllProducts;

      expect(() => call(), throwsA(const TypeMatcher<ServerExeption>()));
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
    test(
        'should perform a Post request on a URL and with application/json Header and body',
        () async {
      when(mockFakeHttpClient.post(any,
              body: anyNamed('body'), headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(fixture('product.json'), 201));

      dataSourceImpl.createProduct(tProductModel);

      Uri uri = Uri.parse('$apiUrl/products/');

      verify(mockFakeHttpClient.post(uri,
          body: tProductModel.toJson(),
          headers: {'Content-Type': 'application/json'}));
    });

    test('should return a Product when the response is 201', () async {
      when(mockFakeHttpClient.post(any,
              body: anyNamed('body'), headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(fixture('product.json'), 201));

      final result = await dataSourceImpl.createProduct(tProductModel);

      Uri uri = Uri.parse('$apiUrl/products/');
      verify(mockFakeHttpClient.post(uri,
          body: tProductModel.toJson(),
          headers: {'Content-Type': 'application/json'}));

      expect(result, tProductModel);
    });
    test('should return a Product when the response is 404 or other', () async {
      when(mockFakeHttpClient.post(any,
              body: anyNamed('body'), headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(fixture('product.json'), 404));

      final call = dataSourceImpl.createProduct;

      expect(() => call(tProductModel),
          throwsA(const TypeMatcher<ServerExeption>()));

      Uri uri = Uri.parse('$apiUrl/products/');
      verify(mockFakeHttpClient.post(uri,
          body: tProductModel.toJson(),
          headers: {'Content-Type': 'application/json'}));
      verifyNoMoreInteractions(mockFakeHttpClient);
    });
  });
}
