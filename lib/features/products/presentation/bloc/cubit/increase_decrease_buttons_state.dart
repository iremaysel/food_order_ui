part of 'increase_decrease_buttons_cubit.dart';

class IncreaseDecreaseButtonsState extends Equatable {
  final int cant;

  const IncreaseDecreaseButtonsState(this.cant);

  IncreaseDecreaseButtonsState copyWith(int cant) =>
      IncreaseDecreaseButtonsState(cant);

  @override
  List<Object?> get props => [cant];
}
