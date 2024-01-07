import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'increase_decrease_buttons_state.dart';

class IncreaseDecreaseButtonsCubit extends Cubit<IncreaseDecreaseButtonsState> {
  IncreaseDecreaseButtonsCubit() : super(const IncreaseDecreaseButtonsState(1));

  void increment() {
    int cantidad = state.cant;

    emit(IncreaseDecreaseButtonsState(state.copyWith(cantidad + 1).cant));
  }

  void decrement() {
    int cantidad = state.cant;

    if (cantidad > 1) {
      emit(IncreaseDecreaseButtonsState(state.copyWith(cantidad - 1).cant));
    }
  }
}
