import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:food_order_ui/features/products/data/datasources/product_local_data_source.dart';
import 'package:food_order_ui/features/products/domain/usecases/get_all_favorite_products_form_DB.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/platform/network/network_info.dart';
import 'features/products/data/repositories/product_repository_imp.dart';
import 'features/products/domain/usecases/get_product_by_id_usecase.dart';
import 'features/products/domain/usecases/remove_favorite_product_from_DB.dart';
import 'features/products/domain/usecases/save_product_favorites_into_db.dart';
import 'features/products/presentation/bloc/bloc/favorites_bloc/favorites_bloc.dart';
import 'features/products/presentation/bloc/bloc/product_bloc/product_bloc.dart';
import 'package:get_it/get_it.dart';

import 'features/products/data/datasources/product_remote_datasource.dart';
import 'features/products/domain/repositories/product_repository.dart';
import 'features/products/domain/usecases/get_all_products_usecase.dart';
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

  getIt.registerSingleton<ProductRemoteDataSource>(
      ProductRemoteDataSourceImpl(client: getIt()));

  getIt.registerSingleton<ProductLocalDataSource>(
      ProductLocalDataSourceImpl(sharedP: await getIt.getAsync()));

  //?Repositories

  getIt.registerSingleton<ProductRepository>(ProductRepositoryImpl(
      localDataSource: getIt<ProductLocalDataSource>(),
      networkInfo: getIt<NetworkInfo>(),
      remoteDataSource: getIt<ProductRemoteDataSource>()));

  //? UseCases

  getIt.registerSingleton(GetAllProductsUseCase(getIt<ProductRepository>()));
  getIt.registerSingleton(GetProductByIdUseCase(getIt<ProductRepository>()));
  getIt.registerSingleton(
      GetAllFavoriteProductsFromDBUseCase(getIt<ProductRepository>()));
  getIt.registerSingleton(
      SaveProductFavoriteIntoDBUseCase(getIt<ProductRepository>()));
  getIt.registerSingleton(
      RemoveFavoriteProductFromDBUseCase(getIt<ProductRepository>()));

  //? Blocs
  //Blocs
  getIt.registerFactory<ProductBloc>(
    () => ProductBloc(
      getProductByIdUseCase: getIt<GetProductByIdUseCase>(),
      getAllProductsUseCase: getIt<GetAllProductsUseCase>(),
    ),
  );
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

  //Core
}
