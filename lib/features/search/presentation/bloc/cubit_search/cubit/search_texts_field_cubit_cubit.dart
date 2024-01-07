import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_texts_field_cubit_state.dart';

class SearchTextsFieldCubitCubit extends Cubit<SearchTextsFieldCubitState> {
  SearchTextsFieldCubitCubit() : super(const SearchTextsFieldCubitState(''));

  void updateQuery(String query) {
    emit(state.copyWith(query: query));
  }
}
