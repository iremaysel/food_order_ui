part of 'five_start_products_bloc_bloc.dart';

abstract class FiveStartProductsBlocEvent extends Equatable {
  const FiveStartProductsBlocEvent();

  @override
  List<Object> get props => [];
}

class StartedFiveStartProductsEvent extends FiveStartProductsBlocEvent {}
