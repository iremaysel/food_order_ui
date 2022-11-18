part of 'stepper_cubit.dart';

class StepperState extends Equatable {
  final int currentStep;
  final bool isLastStep;
  const StepperState({required this.currentStep, required this.isLastStep});

  StepperState copyWith({
    int? currentStep,
    bool? isLastStep,
  }) {
    return StepperState(
      currentStep: currentStep ?? this.currentStep,
      isLastStep: isLastStep ?? this.isLastStep,
    );
  }

  @override
  List<Object> get props => [currentStep, isLastStep];
}
