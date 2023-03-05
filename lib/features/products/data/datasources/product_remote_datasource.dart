import 'dart:convert';

import '../../../../core/constantes/constantes.dart';

import '../../../../core/error/exeptions.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';

import '../../../../core/shared/entities/product.dart';
import 'package:http/http.dart' as http;

abstract class ProductRemoteDataSource {
  Future<List<Product>> getAllProducts();
  Future<List<Product>> getProductsByCategory(CategoryModel cat);
  Future<List<Product>> getAllFiveStartRatingProducts();
  Future<Product> createProduct(ProductModel product);

  Future<Product> getProductById(String id);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;

  ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<List<Product>> getAllProducts() async {
    Uri uri = Uri.parse('$apiUrl/products/');
    final response =
        await client.get(uri, headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      List<Product> list = [];
      Map<String, dynamic> responseProductlist = json.decode(response.body);

      List<dynamic> listProducts = responseProductlist['products'];

      listProducts
          .map((item) => list.add(ProductModel.fromJson(item)))
          .toList();
      return list;
    } else {
      throw ServerExeption();
    }
  }

  @override
  Future<Product> getProductById(String id) async {
    Uri uri = Uri.parse('$apiUrl/products/$id');
    final response =
        await client.get(uri, headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      return ProductModel.fromJson(json.decode(response.body));
    } else {
      throw ServerExeption();
    }
  }

  @override
  Future<Product> createProduct(ProductModel product) async {
    Uri uri = Uri.parse('$apiUrl/products/');
    final response = await client.post(uri,
        body: product.toJson(), headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 201) {
      return ProductModel.fromJson(json.decode(response.body));
    } else {
      throw ServerExeption();
    }
  }

//no esta implementado todavia este metdo en la api
  @override
  Future<List<Product>> getAllFiveStartRatingProducts() async {
    Uri uri = Uri.parse('$apiUrl/products/favorites');
    final response =
        await client.get(uri, headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      List<Product> list = [];
      Map<String, dynamic> responseProductlist = json.decode(response.body);
      List<dynamic> listProducts = responseProductlist['products'];
      listProducts
          .map((item) => list.add(ProductModel.fromJson(item)))
          .toList();
      return list;
    } else {
      throw ServerExeption();
    }
  }

  @override
  Future<List<Product>> getProductsByCategory(CategoryModel cat) async {
    Uri uri = Uri.parse('$apiUrl/products/category/${cat.id}');
    final response =
        await client.get(uri, headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      List<Product> list = [];
      Map<String, dynamic> responseProductlist = json.decode(response.body);
      List<dynamic> listProducts = responseProductlist['products'];

      listProducts
          .map((item) => list.add(ProductModel.fromJson(item)))
          .toList();
      return list;
    } else {
      throw ServerExeption();
    }
  }
}
