import 'package:equatable/equatable.dart';

import '../../../../core/shared/entities/product.dart';

class CartModel extends Equatable {
  final List<Product> product;
  double get subtotal =>
      product.fold(0, (total, current) => total + current.price!);

  const CartModel({required this.product});
  @override
  List<Object?> get props => [product, subtotal];
}
