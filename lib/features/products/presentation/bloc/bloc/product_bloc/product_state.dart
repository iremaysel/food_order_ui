part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitialState extends ProductState {}

class ProductLoadindState extends ProductState {}

class ProductsLoadedState extends ProductState {
  final List<Product> productList;

  const ProductsLoadedState({required this.productList});
  @override
  List<Object> get props => [productList];
}

class ProductErrorState extends ProductState {
  final String errorMesagge;

  const ProductErrorState({required this.errorMesagge});
  @override
  List<Object> get props => [errorMesagge];
}
