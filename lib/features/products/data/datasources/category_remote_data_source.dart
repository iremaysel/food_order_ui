import 'dart:convert';

import 'package:food_order_ui/core/constantes/constantes.dart';
import 'package:food_order_ui/core/error/exeptions.dart';

import '../../domain/entities/category.dart';
import 'package:http/http.dart' as http;

abstract class CategoryRemoteDataSource {
  Future<List<Category>> getCategories();
  Future<Category> createCategory(Category cat);
  Future<Category> getCategoryById(String catId);
  Future<Category> updateCategory(Category cat);
  Future<Category> removeCategory(Category cat);
}

class CategoryRemoteDataSourceImpl extends CategoryRemoteDataSource {
  final http.Client client;

  CategoryRemoteDataSourceImpl(this.client);

  @override
  Future<Category> createCategory(Category cat) async {
    try {
      final url = Uri.parse('$apiUrl/categories/');
      final response = await client.post(url,
          headers: {'Content-Type': 'application/json'},
          body: json.encode(cat.toJson()));

      if (response.statusCode == 201) {
        final Map<String, dynamic> catMap = jsonDecode(response.body);
        return Category.fromJson(catMap);
      } else {
        throw ServerExeption();
      }
    } catch (e) {
      throw ServerExeption();
    }
  }

  @override
  Future<List<Category>> getCategories() async {
    try {
      final url = Uri.parse('$apiUrl/categories/');
      final response =
          await client.get(url, headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 200) {
        final List<Category> list = [];

        final Map<String, dynamic> categoryMapResponse =
            jsonDecode(response.body);
        final List<dynamic> categoryLisy = categoryMapResponse['categories'];
        categoryLisy
            .map((category) => list.add(Category.fromJson(category)))
            .toList();
        return list;
      } else {
        throw ServerExeption();
      }
    } on Exception {
      throw ServerExeption();
    }
  }

  @override
  Future<Category> getCategoryById(String catId) async {
    try {
      final url = Uri.parse('$apiUrl/categories/$catId');
      final response =
          await client.get(url, headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 200) {
        final Map<String, dynamic> catMap = json.decode(response.body);
        return Category.fromJson(catMap);
      } else {
        throw ServerExeption();
      }
    } catch (e) {
      throw ServerExeption();
    }
  }

  @override
  Future<Category> removeCategory(Category cat) {
    // TODO: implement removeCategory
    throw UnimplementedError();
  }

  @override
  Future<Category> updateCategory(Category cat) {
    // TODO: implement updateCategory
    throw UnimplementedError();
  }
}
