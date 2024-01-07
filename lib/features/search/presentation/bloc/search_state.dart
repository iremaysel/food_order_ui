part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitialState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchLoadedState extends SearchState {
  final List<Product> products;

  const SearchLoadedState(this.products);

  @override
  List<Object> get props => [products];
}

class SearchErrorState extends SearchState {}
