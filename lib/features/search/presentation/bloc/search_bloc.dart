import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/shared/entities/product.dart';
import '../../domain/usecases/product_search_caseuse.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ProductSearchUseCase productSearchUseCase;

  SearchBloc(this.productSearchUseCase) : super(SearchInitialState()) {
    on<SearchRequestedEvent>(_onSearchRequestedEventToState);
  }

  FutureOr<void> _onSearchRequestedEventToState(
      SearchRequestedEvent event, Emitter<SearchState> emit) async {
    emit(SearchLoadingState());

    

    final result = await productSearchUseCase.call(
        query: event.query, products: event.products);

      result.fold((failure) => emit(SearchErrorState()),
        (products) => emit(SearchLoadedState(products)));
      
        
  }
}
