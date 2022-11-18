part of 'product_by_category_bloc.dart';

abstract class ProductByCategoryEvent extends Equatable {
  const ProductByCategoryEvent();

  @override
  List<Object> get props => [];
}

class ProductByCategoriesRequestedEvent extends ProductByCategoryEvent {
  final CategoryModel category;

  const ProductByCategoriesRequestedEvent({
    required this.category,
  });

  @override
  List<Object> get props => [category];
}
