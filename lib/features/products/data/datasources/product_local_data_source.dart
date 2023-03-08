import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/shared/entities/product.dart';
import '../models/product_model.dart';

abstract class ProductLocalDataSource {
  Future<Product> saveProductFavoriteIntoDB(ProductModel product);
  Future<Product> removeProductFavoriteIntoDB(ProductModel product);
  Future<List<Product>> getAllFavoriteProductsFromDB();
}

class ProductLocalDataSourceImpl extends ProductLocalDataSource {
  final SharedPreferences sharedP;

  ProductLocalDataSourceImpl({required this.sharedP});

  List<Product> getListOfFavoritesProductFromDb() {
    String? productListJson = sharedP.getString('favorites');

    if (productListJson != null) {
      List<Product> listProducts = [];
      List<dynamic> responseProductlist = json.decode(productListJson);

      responseProductlist
          .map((item) => listProducts.add(ProductModel.fromJson(item)))
          .toList();

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

      print(listProducts);

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

    listProducts.remove(product);

    String newProductList = json.encode(listProducts);

    sharedP.setString('favorites', newProductList);

    return Future.value(product);
  }
}
