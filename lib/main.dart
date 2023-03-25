import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_ui/core/platform/network/bloc/internet_bloc.dart';
import 'package:food_order_ui/features/products/presentation/bloc/bloc/category/category_bloc.dart';
import 'package:food_order_ui/features/products/presentation/bloc/bloc/product_by_category.dart/product_by_category_bloc.dart';
import 'package:food_order_ui/features/search/domain/usecases/product_search_caseuse.dart';
import 'package:food_order_ui/features/search/presentation/bloc/cubit_search/cubit/search_texts_field_cubit_cubit.dart';
import 'package:food_order_ui/features/search/presentation/bloc/search_bloc.dart';

import 'features/auth/domain/usecases/login_user_with_email_and_password_usecase.dart';
import 'features/auth/domain/usecases/register_user_with_email_and_password_usecase.dart';
import 'features/auth/presentation/bloc/authetication/authentication_bloc.dart';
import 'features/auth/presentation/bloc/cubit/login_text_fields_helper_cubit.dart';
import 'features/auth/presentation/bloc/login/login_bloc.dart';
import 'features/auth/presentation/bloc/register/register_bloc.dart';
import 'features/main_components/bloc/cubit/nav_bar_cubit_cubit.dart';
import 'features/products/domain/usecases/category/get_categories_usecase.dart';
import 'features/products/domain/usecases/products/get_products_by_category_usecase.dart';
import 'features/products/presentation/bloc/bloc/favorites_bloc/favorites_bloc.dart';
import 'features/products/presentation/bloc/bloc/five_starts_products_bloc/bloc/five_start_products_bloc_bloc.dart';
import 'dependency_Injection.dart' as sl;
import 'features/main_components/pages/splash_screen.dart';

import 'dependency_Injection.dart';
import 'features/payments/presentation/bloc/cart_bloc.dart';
import 'features/products/domain/usecases/products/get_all_favorite_products_form_DB.dart';
import 'features/products/domain/usecases/products/get_all_five_start_rating_product_use_case.dart';
import 'features/products/domain/usecases/products/get_all_products_usecase.dart';
import 'features/products/domain/usecases/products/get_product_by_id_usecase.dart';
import 'features/products/domain/usecases/products/remove_favorite_product_from_DB.dart';
import 'features/products/domain/usecases/products/save_product_favorites_into_db.dart';
import 'features/products/presentation/bloc/bloc/product_bloc/product_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sl.init();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) {
    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => NavBarCubitCubit(),
          ),
          BlocProvider(
              create: (_) => InternetBloc(
                    dataConnectionChecker: getIt(),
                  )),
          BlocProvider(create: (_) => LoginTextFieldsHelperCubit()),
          BlocProvider(create: (_) => SearchTextsFieldCubitCubit()),
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
            create: (context) => RegisterBloc(
              usecase: getIt<RegisterUserWithEmailAndPasswordUsecase>(),
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
            create: (_) => SearchBloc(
              getIt<ProductSearchUseCase>(),
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
          BlocProvider(
            create: (_) => CategoryBloc(
                getCategoriesUseCase: getIt<GetCategoriesUseCase>()),
          ),
          BlocProvider(
            create: (context) =>
                ProductByCategoryBloc(getIt<GetProductsByCategoryUseCase>()),
          )
        ],
        child: const MyApp(),
      ),
    );
  });
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
