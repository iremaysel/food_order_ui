// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_texts_field_cubit_cubit.dart';

class SearchTextsFieldCubitState extends Equatable {
  final String query;

  const SearchTextsFieldCubitState(this.query);

  @override
  List<Object> get props => [query];

  SearchTextsFieldCubitState copyWith({
    String? query,
  }) {
    return SearchTextsFieldCubitState(
      query ?? this.query,
    );
  }
}
