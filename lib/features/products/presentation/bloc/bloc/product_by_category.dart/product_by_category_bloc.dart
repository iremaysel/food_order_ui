import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_order_ui/core/shared/entities/product.dart';
import 'package:food_order_ui/features/products/domain/entities/category.dart';
import 'package:food_order_ui/features/products/domain/usecases/products/get_product_by_id_usecase.dart';

part 'product_by_category_event.dart';
part 'product_by_category_state.dart';

class ProductByCategoryBloc
    extends Bloc<ProductByCategoryEvent, ProductByCategoryState> {
  final GetProductByIdUseCase getProductByIdUseCase;
  ProductByCategoryBloc({required this.getProductByIdUseCase})
      : super(ProductByCategoryInitial()) {
    on<ProductByCategoriesRequestedEvent>(
        _onProductByCategoriesRequestedEventToState);
  }

  FutureOr<void> _onProductByCategoriesRequestedEventToState(
      ProductByCategoriesRequestedEvent event,
      Emitter<ProductByCategoryState> emit) async {
    final List<Product> productList = [];

    event.category.products.map((prodId) async {
      final either = await getProductByIdUseCase(prodId);
      either.fold((failure) => emit(ProductByCategoryError()),
          (prduct) => productList.add(prduct));
    });

    emit(ProductByCategoryLoaded(products: productList));
  }
}
