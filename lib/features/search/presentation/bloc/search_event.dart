part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchRequestedEvent extends SearchEvent {
  final String query;
  final List<Product> products;

  const SearchRequestedEvent({required this.query, required this.products});
  @override
  List<Object> get props => [query, products];
}
