part of 'product_by_category_bloc.dart';

abstract class ProductByCategoryState extends Equatable {
  const ProductByCategoryState();

  @override
  List<Object> get props => [];
}

class ProductByCategoryInitial extends ProductByCategoryState {}

class ProductByCategoryLoading extends ProductByCategoryState {}

class ProductByCategoryLoaded extends ProductByCategoryState {
  final List<Product> products;

  const ProductByCategoryLoaded({required this.products});
  @override
  List<Object> get props => [products];
}

class ProductByCategoryError extends ProductByCategoryState {}
