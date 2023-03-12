import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/shared/entities/product.dart';
import '../../../../domain/usecases/products/get_all_products_usecase.dart';
import '../../../../domain/usecases/products/get_product_by_id_usecase.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetAllProductsUseCase getAllProductsUseCase;
  final GetProductByIdUseCase getProductByIdUseCase;

  ProductBloc({
    required this.getProductByIdUseCase,
    required this.getAllProductsUseCase,
  }) : super(ProductInitialState()) {
    on<ProductsStartedEvent>(_onGetProductCallback);
  }

  FutureOr<void> _onGetProductCallback(
      ProductsStartedEvent event, Emitter<ProductState> emit) async {
        
    emit(ProductLoadindState());

    final result = await getAllProductsUseCase();

    final newState = result.fold(
        (failure) => const ProductErrorState(errorMesagge: 'Server Error'),
        (productList) => ProductsLoadedState(productList: productList));

    emit(newState);
  }
}
