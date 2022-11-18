import 'dart:convert';

import 'package:food_order_ui/core/error/exeptions.dart';
import 'package:food_order_ui/features/auth/data/models/user_model.dart';
import 'package:food_order_ui/features/auth/domain/entities/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constantes/constantes.dart';

abstract class UserRemoteDataSource {
  Future<User> loginUserWithEmailAndPassword(
      {required String email, required String password});

  //////////////////////
  Future<User> registerUserWithEmailAndPassword(
      {required String fullName,
      required String email,
      required String password});
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  final http.Client client;
  final SharedPreferences sharedPreferences;

  UserRemoteDataSourceImpl(
      {required this.sharedPreferences, required this.client});

  @override
  Future<User> loginUserWithEmailAndPassword(
      {required String email, required String password}) async {
    Uri uri = Uri.parse('$apiUrl/auth/login/');

    final response = await client.post(uri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({"email": email, "password": password}));

    if (response.statusCode == 200) {
      Map<String, dynamic> responseUserMap = json.decode(response.body);

      sharedPreferences.setString('jwt', responseUserMap['jwt']);
      final User user = UserModel.fromJson(responseUserMap['user']);
      print(user);
      return user;
    }
    if (response.statusCode == 401) {
      throw UnauthorizedExeption();
    } else {
      throw ServerExeption();
    }
  }

  @override
  Future<User> registerUserWithEmailAndPassword({
    required String fullName,
    required String email,
    required String password,
  }) async {
    Uri uri = Uri.parse('$apiUrl/api/auth/register/');

    final response = await client.post(uri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
            {"fullname": fullName, "email": email, "password": password}));

    if (response.statusCode == 200) {
      Map<String, dynamic> responseUserMap = json.decode(response.body);
      sharedPreferences.setString('jwt', responseUserMap['jwt']);
      return UserModel.fromJson(responseUserMap['user']);
    } else {
      throw ServerExeption();
    }
  }
}
