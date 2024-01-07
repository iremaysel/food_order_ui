import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'stepper_state.dart';

class StepperCubit extends Cubit<StepperState> {
  StepperCubit() : super(const StepperState(currentStep: 0, isLastStep: false));
  void stepContinue() {
    if (state.currentStep == 2) {
      emit(state.copyWith(isLastStep: true));
    }
    if (state.currentStep < 2) {
      emit(state.copyWith(
          currentStep: state.currentStep + 1, isLastStep: false));
    }
  }

  void stepBack() {
    emit(state.copyWith(currentStep: state.currentStep - 1, isLastStep: false));
  }

  void steptap(int i) {
    if (i == 2) {
      emit(state.copyWith(isLastStep: true));
    }
    emit(state.copyWith(currentStep: i, isLastStep: false));
  }
}
