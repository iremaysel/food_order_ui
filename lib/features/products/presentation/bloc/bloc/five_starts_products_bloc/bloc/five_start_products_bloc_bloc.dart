import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../domain/usecases/get_all_five_start_rating_product_use_case.dart';

import '../../../../../../../core/shared/entities/product.dart';

part 'five_start_products_bloc_event.dart';
part 'five_start_products_bloc_state.dart';

class FiveStartProductsBloc
    extends Bloc<FiveStartProductsBlocEvent, FiveStartProductsBlocState> {
  final GetAllFiveStartRatingProductsUseCase
      getAllFiveStartRatingProductsUseCase;

  FiveStartProductsBloc({
    required this.getAllFiveStartRatingProductsUseCase,
  }) : super(FiveStartProductsBlocInitialState()) {
    on<StartedFiveStartProductsEvent>(_onStartFiveStartProductsEventToState);
  }

  FutureOr<void> _onStartFiveStartProductsEventToState(
      StartedFiveStartProductsEvent event,
      Emitter<FiveStartProductsBlocState> emit) async {
    emit(FiveStartProductsBlocLoadingState());

    var eitherProducts = await getAllFiveStartRatingProductsUseCase();

    eitherProducts.fold((failure) {
      print('Si entra aqui fue que dio error');
      emit(FiveStartProductsBlocErrorState());
    }, (fiveStartProductList) {
      print(fiveStartProductList);
      emit(FiveStartProductsBlocLoadedSuccessState(fiveStartProductList));
    });
  }
}
