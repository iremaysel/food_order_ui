import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'core/platform/network/network_info.dart';
import 'features/products/data/repositories/product_repository_imp.dart';
import 'features/products/domain/usecases/get_product_by_id_usecase.dart';
import 'features/products/presentation/bloc/bloc/product_bloc.dart';
import 'package:get_it/get_it.dart';

import 'features/products/data/datasources/product_remote_datasource.dart';
import 'features/products/domain/repositories/product_repository.dart';
import 'features/products/domain/usecases/get_all_products_usecase.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

void init() {
  getIt.registerSingleton(http.Client());
  getIt.registerSingleton(DataConnectionChecker());

  getIt.registerSingleton<NetworkInfo>(
      NetworkInfoImpl(getIt<DataConnectionChecker>()));

  getIt.registerSingleton<ProductRemoteDataSource>(
      ProductRemoteDataSourceImpl(client: getIt()));

  getIt.registerSingleton<ProductRepository>(ProductRepositoryImpl(
      networkInfo: getIt<NetworkInfo>(),
      remoteDataSource: getIt<ProductRemoteDataSource>()));

  getIt.registerSingleton(GetAllProductsUseCase(getIt<ProductRepository>()));
  getIt.registerSingleton(GetProductByIdUseCase(getIt<ProductRepository>()));

  //Blocs
  getIt.registerFactory<ProductBloc>(
    () => ProductBloc(
      getProductByIdUseCase: getIt<GetProductByIdUseCase>(),
      getAllProductsUseCase: getIt<GetAllProductsUseCase>(),
    ),
  );

  //Core
}
