import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:food_order_ui/features/products/data/models/product_model.dart';
import 'package:food_order_ui/features/products/domain/entities/product.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
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

  test('Should be a subclass of Product entity', () {
    expect(tProductModel, isA<Product>());
  });

  test('should return a valid Model from the json', () async {
    final Map<String, dynamic> jsonMap = json.decode(fixture('product.json'));

    final resutl = ProductModel.fromJson(fixture('product.json'));

    expect(resutl, tProductModel);
  });

  test('should return a Map fromJson containing the proper data', () async {
    final resutl = tProductModel.toMap();

    final fxpectedJsonMap = {
      "name": "Producto 2",
      "categories": "Bebidas",
      "available": true,
      "rating": 2,
      "description": "Este producto no tiene descripción",
      "quantity": 2,
      "price": 100,
      "img": "bc507322-47e5-4c50-b4ec-762c5f84d21e.png",
      "calories": "",
      "uid": "62d6f062a6a2d738a753302c"
    };

    expect(resutl, fxpectedJsonMap);
  });
}
