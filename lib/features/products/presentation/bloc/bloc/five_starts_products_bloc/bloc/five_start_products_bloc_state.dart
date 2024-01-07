part of 'five_start_products_bloc_bloc.dart';

abstract class FiveStartProductsBlocState extends Equatable {
  const FiveStartProductsBlocState();

  @override
  List<Object> get props => [];
}

class FiveStartProductsBlocInitialState extends FiveStartProductsBlocState {}

class FiveStartProductsBlocLoadingState extends FiveStartProductsBlocState {}

class FiveStartProductsBlocLoadedSuccessState
    extends FiveStartProductsBlocState {
  final List<Product> fiveStartProductList;

  const FiveStartProductsBlocLoadedSuccessState(this.fiveStartProductList);

  @override
  List<Object> get props => [fiveStartProductList];
}

class FiveStartProductsBlocErrorState extends FiveStartProductsBlocState {}
