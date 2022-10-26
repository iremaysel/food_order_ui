import 'dart:convert';

import 'package:food_order_ui/core/error/exeptions.dart';
import 'package:food_order_ui/features/products/data/models/product_model.dart';

import '../../domain/entities/product.dart';
import 'package:http/http.dart' as http;

abstract class ProductRemoteDataSource {
  Future<List<Product>> getAllProducts();
  Future<Product> createProduct(
    Product product,
  );

  Future<Product> getProductById(String id);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;

  ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<List<Product>> getAllProducts() async {
    Uri uri = Uri.parse('http://5.181.217.104:10000/products/');
    final response =
        await client.get(uri, headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      List<Product> list = [];
      Map<String, dynamic> responseProductlist = json.decode(response.body);
      List<dynamic> listProducts = responseProductlist['products'];
      listProducts.map((item) => list.add(ProductModel.fromMap(item))).toList();
      return list;
    } else {
      throw ServerExeption();
    }
  }

  @override
  Future<Product> getProductById(String id) async {
    Uri uri = Uri.parse('http://142.93.203.173:3000/products/$id');
    final response =
        await client.get(uri, headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      return ProductModel.fromJson(response.body);
    } else {
      throw ServerExeption();
    }
  }

  @override
  Future<Product> createProduct(Product product) async {
    Uri uri = Uri.parse('http://5.181.217.104:10000/products/');
    final response = await client.post(uri,
        body: json.encode({
          "name": product.name,
          "categories": product.categories,
          "available": product.available,
          "rating": product.rating,
          "description": product.description,
          "quantity": product.quantity,
          "price": product.price,
          "img": product.img,
          "calories": product.calories,
          "uid": product.uid
        }),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 201) {
      return ProductModel.fromJson(response.body);
    } else {
      throw ServerExeption();
    }
  }
}
