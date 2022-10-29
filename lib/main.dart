import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dependency_Injection.dart' as sl;
import 'features/main_components/pages/splash_screen.dart';

import 'dependency_Injection.dart';
import 'features/products/domain/usecases/get_all_products_usecase.dart';
import 'features/products/domain/usecases/get_product_by_id_usecase.dart';
import 'features/products/presentation/bloc/bloc/product_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  sl.init();
  runApp(
    BlocProvider(
      create: (_) => ProductBloc(
        getAllProductsUseCase: getIt<GetAllProductsUseCase>(),
        getProductByIdUseCase: getIt<GetProductByIdUseCase>(),
      )..add(OnGetProductsEvent()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Ordering',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const SplashScreen(),
    );
  }
}
