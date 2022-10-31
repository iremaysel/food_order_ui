import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String categories;
  final bool available;

  final int? rating;
  final String description;
  final int? quantity;
  final int price;
  final String? img;
  final String? calories;
  final String uid;

  const Product({
    required this.name,
    required this.categories,
    required this.available,
    this.rating,
    required this.description,
    this.quantity,
    required this.price,
    this.img,
    required this.uid,
    this.calories,
  });

  @override
  List<Object?> get props => [
        name,
        categories,
        available,
        rating,
        description,
        quantity,
        price,
        img,
        uid,
        calories
      ];
}
