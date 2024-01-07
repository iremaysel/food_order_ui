import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_order_ui/core/shared/entities/product.dart';
import 'package:food_order_ui/features/products/domain/usecases/products/get_products_by_category_usecase.dart';

import '../../../../data/models/category_model.dart';

part 'product_by_category_event.dart';
part 'product_by_category_state.dart';

class ProductByCategoryBloc extends Bloc<ProductByCategoryEvent, ProductByCategoryState> {
    
  final GetProductsByCategoryUseCase getProductsByCategory;

  ProductByCategoryBloc(this.getProductsByCategory)
      : super(ProductByCategoryInitial()) {


    on<ProductByCategoriesRequestedEvent>(_onProductByCategoriesRequestedEventToState);
    
        
  }

  FutureOr<void> _onProductByCategoriesRequestedEventToState(
      ProductByCategoriesRequestedEvent event,
      Emitter<ProductByCategoryState> emit) async {
    
    emit(ProductByCategoryLoading());

    final eitherResult = await getProductsByCategory(event.category);

    eitherResult.fold(
      (failure) => emit(ProductByCategoryError()),
      (products) => emit(ProductByCategoryLoaded(products: products)),
    );
  }
}
