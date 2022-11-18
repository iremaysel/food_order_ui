import 'dart:async';

import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:food_order_ui/core/platform/network/bloc/internet_bloc.dart';
import 'package:food_order_ui/features/auth/data/repositories/auth_user_repository_impl.dart';
import 'package:food_order_ui/features/auth/domain/repositories/auth_user_repository.dart';
import 'package:food_order_ui/features/auth/domain/usecases/login_user_with_email_and_password_usecase.dart';
import 'package:food_order_ui/features/auth/domain/usecases/register_user_with_email_and_password_usecase.dart';
import 'package:food_order_ui/features/products/data/repositories/category_repository_impl.dart';
import 'package:food_order_ui/features/products/domain/usecases/category/create_category_usecase.dart';
import 'package:food_order_ui/features/products/domain/usecases/products/get_products_by_category_usecase.dart';
import 'package:food_order_ui/features/products/presentation/bloc/bloc/category/category_bloc.dart';
import 'package:food_order_ui/features/products/presentation/bloc/bloc/product_by_category.dart/product_by_category_bloc.dart';
import 'features/auth/data/datasource/user_remote_data_source.dart';
import 'features/auth/presentation/bloc/authetication/authentication_bloc.dart';
import 'features/auth/presentation/bloc/cubit/login_text_fields_helper_cubit.dart';
import 'features/auth/presentation/bloc/login/login_bloc.dart';
import 'features/auth/presentation/bloc/register/register_bloc.dart';

import 'features/products/data/datasources/category_remote_data_source.dart';
import 'features/products/data/datasources/product_local_data_source.dart';
import 'features/products/domain/repositories/category_repository.dart';
import 'features/products/domain/usecases/category/get_categories_by_id_usecase.dart';
import 'features/products/domain/usecases/category/get_categories_usecase.dart';
import 'features/products/domain/usecases/category/remove_category_usecase.dart';
import 'features/products/domain/usecases/category/update_category_usecase.dart';
import 'features/products/domain/usecases/products/create_product_usecase.dart';
import 'features/products/domain/usecases/products/get_all_favorite_products_form_DB.dart';
import 'features/products/presentation/bloc/bloc/favorites_bloc/cubit/fav_icon_cubit.dart';
import 'features/products/presentation/bloc/bloc/five_starts_products_bloc/bloc/five_start_products_bloc_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/platform/network/network_info.dart';
import 'features/payments/presentation/bloc/cart_bloc.dart';
import 'features/products/data/repositories/product_repository_imp.dart';
import 'features/products/domain/usecases/products/get_all_five_start_rating_product_use_case.dart';
import 'features/products/domain/usecases/products/get_product_by_id_usecase.dart';
import 'features/products/domain/usecases/products/remove_favorite_product_from_DB.dart';
import 'features/products/domain/usecases/products/save_product_favorites_into_db.dart';
import 'features/products/presentation/bloc/bloc/favorites_bloc/favorites_bloc.dart';
import 'features/products/presentation/bloc/bloc/product_bloc/product_bloc.dart';
import 'package:get_it/get_it.dart';

import 'features/products/data/datasources/product_remote_datasource.dart';
import 'features/products/domain/repositories/product_repository.dart';
import 'features/products/domain/usecases/products/get_all_products_usecase.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerSingleton(http.Client());
  getIt.registerSingleton(DataConnectionChecker());

  getIt.registerSingleton<NetworkInfo>(
      NetworkInfoImpl(getIt<DataConnectionChecker>()));

  getIt.registerLazySingletonAsync<SharedPreferences>(
      () async => SharedPreferences.getInstance());

//////////////////////////////////////////////////////////////
  //? DataSources

  getIt.registerSingleton<CategoryRemoteDataSource>(
      CategoryRemoteDataSourceImpl(getIt<http.Client>()));

  getIt.registerSingleton<UserRemoteDataSource>(UserRemoteDataSourceImpl(
      client: getIt<http.Client>(), sharedPreferences: await getIt.getAsync()));

  getIt.registerSingleton<ProductRemoteDataSource>(
      ProductRemoteDataSourceImpl(client: getIt()));

  getIt.registerSingleton<ProductLocalDataSource>(
      ProductLocalDataSourceImpl(sharedP: await getIt.getAsync()));

  //?Repositories
  getIt.registerSingleton<CategoryRepository>(CategoryRepositoryImpl(
    remoteDataSource: getIt<CategoryRemoteDataSource>(),
    networkInfo: getIt<NetworkInfo>(),
  ));

  getIt.registerSingleton<AuthUserRepository>(AuthUserRepositoryImpl(
      networkInfo: getIt<NetworkInfo>(),
      userRemoteDataSource: getIt<UserRemoteDataSource>()));

  getIt.registerSingleton<ProductRepository>(ProductRepositoryImpl(
      localDataSource: getIt<ProductLocalDataSource>(),
      networkInfo: getIt<NetworkInfo>(),
      remoteDataSource: getIt<ProductRemoteDataSource>()));

  //? UseCases
  //?Categories UseCases...
  getIt.registerSingleton(CreateCategoryUseCase(getIt<CategoryRepository>()));
  getIt.registerSingleton(RemoveCategoryUseCase(getIt<CategoryRepository>()));
  getIt.registerSingleton(GetCategoriesUseCase(getIt<CategoryRepository>()));
  getIt.registerSingleton(GetCategoryByIdUseCase(getIt<CategoryRepository>()));
  getIt.registerSingleton(UpdateCategoryUseCase(getIt<CategoryRepository>()));

  //?Product UseCases...

  getIt.registerSingleton(GetAllProductsUseCase(getIt<ProductRepository>()));
  getIt.registerSingleton(
      GetProductsByCategoryUseCase(getIt<ProductRepository>()));
  getIt.registerSingleton(CreateProductUseCase(getIt<ProductRepository>()));
  getIt.registerSingleton(GetProductByIdUseCase(getIt<ProductRepository>()));
  getIt.registerSingleton(
      GetAllFiveStartRatingProductsUseCase(getIt<ProductRepository>()));
  getIt.registerSingleton(
      GetAllFavoriteProductsFromDBUseCase(getIt<ProductRepository>()));
  getIt.registerSingleton(
      SaveProductFavoriteIntoDBUseCase(getIt<ProductRepository>()));
  getIt.registerSingleton(
      RemoveFavoriteProductFromDBUseCase(getIt<ProductRepository>()));

  //? User UseCase...
  getIt.registerLazySingleton(
      () => LoginUserWithEmailAndPasswordUsecase(getIt<AuthUserRepository>()));
  getIt.registerLazySingleton(() =>
      RegisterUserWithEmailAndPasswordUsecase(getIt<AuthUserRepository>()));

  //? Blocs
  //Blocs
  getIt.registerFactory<ProductBloc>(
    () => ProductBloc(
      getProductByIdUseCase: getIt<GetProductByIdUseCase>(),
      getAllProductsUseCase: getIt<GetAllProductsUseCase>(),
    ),
  );
  getIt.registerFactory<InternetBloc>(
    () => InternetBloc(dataConnectionChecker: getIt()),
  );
  getIt.registerFactory<FiveStartProductsBloc>(
    () => FiveStartProductsBloc(
        getAllFiveStartRatingProductsUseCase:
            getIt<GetAllFiveStartRatingProductsUseCase>()),
  );
  getIt.registerFactory<CartBloc>(
    () => CartBloc(),
  );
  getIt.registerFactory(() => FavIconCubit());
  getIt.registerFactory<FavoritesBloc>(
    () => FavoritesBloc(
      getAllFavoriteProductsFromDBUseCase:
          getIt<GetAllFavoriteProductsFromDBUseCase>(),
      removeFavoriteProductFromDBUseCase:
          getIt<RemoveFavoriteProductFromDBUseCase>(),
      saveProductFavoriteIntoDBUseCase:
          getIt<SaveProductFavoriteIntoDBUseCase>(),
    ),
  );
  final SharedPreferences sharedPreferencesInstance = await getIt.getAsync();
  getIt.registerSingleton<AuthenticationBloc>(
      AuthenticationBloc(sharedPreferences: sharedPreferencesInstance));

  getIt.registerSingletonAsync(() async => LoginBloc(
      authenticationBloc: getIt<AuthenticationBloc>(),
      sharedPreferences: sharedPreferencesInstance,
      usecase: getIt<LoginUserWithEmailAndPasswordUsecase>()));

  getIt.registerFactoryAsync(() async => RegisterBloc(
      authenticationBloc: getIt<AuthenticationBloc>(),
      sharedPreferences: sharedPreferencesInstance,
      usecase: getIt<RegisterUserWithEmailAndPasswordUsecase>()));

  getIt.registerFactory<LoginTextFieldsHelperCubit>(
      () => LoginTextFieldsHelperCubit());

  getIt.registerFactory(
      () => CategoryBloc(getCategoriesUseCase: getIt<GetCategoriesUseCase>()));
  getIt.registerFactory(
      () => ProductByCategoryBloc(getIt<GetProductsByCategoryUseCase>()));

  //Core
}
