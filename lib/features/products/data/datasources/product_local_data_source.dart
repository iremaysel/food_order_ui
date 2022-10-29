import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/product.dart';
import '../models/product_model.dart';

abstract class ProductLocalDataSource {
  Future<Product> saveProductFavoriteIntoDB(ProductModel product);
  Future<Product> removeProductFavoriteIntoDB(ProductModel product);
  Future<List<Product>> getAllFavoriteProductsFromDB();
}

class ProductLocalDataSourceImpl extends ProductLocalDataSource {
  final SharedPreferences sharedP;

  ProductLocalDataSourceImpl({required this.sharedP});

  List<Product> getListOfProductFromDb() {
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
    List<Product> listProducts = getListOfProductFromDb();

    if (listProducts.contains(product)) {
      String newProductList = json.encode(listProducts);

      sharedP.setString('favorites', newProductList);

      return Future.value(product);
    } else {
      listProducts.add(product);

      String newProductList = json.encode(listProducts);

      sharedP.setString('favorites', newProductList);

      return Future.value(product);
    }
  }

  @override
  Future<List<Product>> getAllFavoriteProductsFromDB() async {
    List<Product> listProducts = getListOfProductFromDb();
    return Future.value(listProducts);
  }

  @override
  Future<Product> removeProductFavoriteIntoDB(ProductModel product) async {
    List<Product> listProducts = getListOfProductFromDb();

    listProducts.remove(product);

    String newProductList = json.encode(listProducts);

    sharedP.setString('favorites', newProductList);

    return Future.value(product);
  }
}
