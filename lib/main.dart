import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_ui/features/auth/presentation/pages/bloc/authetication/authentication_bloc.dart';
import 'features/auth/domain/usecases/login_user_with_email_and_password_usecase.dart';
import 'features/auth/presentation/pages/bloc/login/login_bloc.dart';
import 'features/products/presentation/bloc/bloc/favorites_bloc/favorites_bloc.dart';
import 'features/products/presentation/bloc/bloc/five_starts_products_bloc/bloc/five_start_products_bloc_bloc.dart';
import 'dependency_Injection.dart' as sl;
import 'features/main_components/pages/splash_screen.dart';

import 'dependency_Injection.dart';
import 'features/payments/presentation/bloc/cart_bloc.dart';
import 'features/products/domain/usecases/get_all_favorite_products_form_DB.dart';
import 'features/products/domain/usecases/get_all_five_start_rating_product_use_case.dart';
import 'features/products/domain/usecases/get_all_products_usecase.dart';
import 'features/products/domain/usecases/get_product_by_id_usecase.dart';
import 'features/products/domain/usecases/remove_favorite_product_from_DB.dart';
import 'features/products/domain/usecases/save_product_favorites_into_db.dart';
import 'features/products/presentation/bloc/bloc/product_bloc/product_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sl.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => AuthenticationBloc(sharedPreferences: getIt())
              ..add(AppStarted())),
        BlocProvider(
          create: (context) => LoginBloc(
            usecase: getIt<LoginUserWithEmailAndPasswordUsecase>(),
            authenticationBloc: getIt<AuthenticationBloc>(),
            sharedPreferences: getIt(),
          ),
        ),
        BlocProvider(
          create: (_) => ProductBloc(
            getAllProductsUseCase: getIt<GetAllProductsUseCase>(),
            getProductByIdUseCase: getIt<GetProductByIdUseCase>(),
          ),
        ),
        BlocProvider(
          create: (_) => FiveStartProductsBloc(
            getAllFiveStartRatingProductsUseCase:
                getIt<GetAllFiveStartRatingProductsUseCase>(),
          ),
        ),
        BlocProvider(
          create: (_) => CartBloc(),
        ),
        BlocProvider(
          create: (_) => FavoritesBloc(
              getAllFavoriteProductsFromDBUseCase:
                  getIt<GetAllFavoriteProductsFromDBUseCase>(),
              removeFavoriteProductFromDBUseCase:
                  getIt<RemoveFavoriteProductFromDBUseCase>(),
              saveProductFavoriteIntoDBUseCase:
                  getIt<SaveProductFavoriteIntoDBUseCase>()),
        ),
      ],
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
