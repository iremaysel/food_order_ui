import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/usecases/get_all_products_usecase.dart';
import '../../../domain/usecases/get_product_by_id_usecase.dart';

import '../../../domain/entities/product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetAllProductsUseCase getAllProductsUseCase;
  final GetProductByIdUseCase getProductByIdUseCase;

  ProductBloc({
    required this.getProductByIdUseCase,
    required this.getAllProductsUseCase,
  }) : super(ProductInitialState()) {
    on<OnGetProductsEvent>(_onGetProductCallback);
  }

  FutureOr<void> _onGetProductCallback(
      OnGetProductsEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoadindState());

    final result = await getAllProductsUseCase.repository.getAllProducts();

    result.fold(
        (failure) =>
            emit(const ProductErrorState(errorMesagge: 'Server Error')),
        (productList) =>
            emit(ProductsLoadedSussesState(productList: productList)));
  }
}
