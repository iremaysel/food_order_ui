import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/shared/entities/product.dart';
import '../../../../core/shared/models/product_model.dart';
import '../models/category_model.dart';

abstract class ProductLocalDataSource {
  Future<Product> saveProductFavoriteIntoDB(ProductModel product);
  Future<Product> removeProductFavoriteIntoDB(ProductModel product);
  Future<List<Product>> getAllFavoriteProductsFromDB();
  Future<List<Product>> searchProducts(
      {required String query, required List<Product> productList});
}

class ProductLocalDataSourceImpl extends ProductLocalDataSource {
  final SharedPreferences sharedP;

  ProductLocalDataSourceImpl({required this.sharedP});

  List<Product> getListOfFavoritesProductFromDb() {
    String? productListJson = sharedP.getString('favorites');

    if (productListJson != null) {
      List<Product> listProducts = [];
      List<dynamic> responseProductlist = json.decode(productListJson);

      responseProductlist.map((item) {
        listProducts.add(ProductModel(
          id: item['id'] as String?,
          name: item['name'] as String?,
          rating: item['rating'] as int?,
          isRecommended: item['isRecommended'] as bool?,
          description: item['description'] as String?,
          price: (item['price'] as num?)?.toDouble(),
          image: item['img'] as String?,
          category: item['category'] == null
              ? null
              : CategoryModel.fromJson(item['category'] as String),
          createdAt: item['createdAt'] as String?,
          isDeleted: item['isDeleted'] as bool?,
        ));
      }).toList();

      return listProducts;
    } else {
      return [];
    }
  }

  @override
  Future<Product> saveProductFavoriteIntoDB(ProductModel product) {
    List<Product> listProducts = getListOfFavoritesProductFromDb();

    if (listProducts.contains(product)) {
      return Future.value(product);
    } else {
      for (var i = 0; i < listProducts.length; i++) {
        if (listProducts[i].id == product.id) {
          listProducts.removeAt(i);
        }
      }

      listProducts.add(product);
      listProducts.sort(
        (a, b) => a.name!.compareTo(b.name!),
      );

      String newProductList = json.encode(listProducts);

      sharedP.setString('favorites', newProductList);

      return Future.value(product);
    }
  }

  @override
  Future<List<Product>> getAllFavoriteProductsFromDB() async {
    List<Product> listProducts = getListOfFavoritesProductFromDb();
    return Future.value(listProducts);
  }

  @override
  Future<Product> removeProductFavoriteIntoDB(ProductModel product) async {
    List<Product> listProducts = getListOfFavoritesProductFromDb();

    listProducts.removeWhere(
      (producto) => producto.id == product.id,
    );

    String newProductList = json.encode(listProducts);

    sharedP.setString('favorites', newProductList);

    return Future.value(product);
  }

  @override
  Future<List<Product>> searchProducts(
      {required String query, required List<Product> productList}) async {
    List<Product> list = [];

    // Verificar si el query es vacío o solo contiene espacios en blanco
    if (query.trim().isEmpty) {
      return list;
    }

    if (query.isNotEmpty) {
      for (var producto in productList) {
        if (producto.name!
            .trim()
            .toLowerCase()
            .contains(query..toLowerCase())) {
          list.add(producto);
        }
      }
    }

    return list;
  }
}
