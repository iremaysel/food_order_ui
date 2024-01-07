import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_order_ui/features/products/domain/entities/category.dart';
import 'package:food_order_ui/features/products/domain/usecases/category/get_categories_usecase.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetCategoriesUseCase getCategoriesUseCase;
  CategoryBloc({required this.getCategoriesUseCase})
      : super(CategoryInitialState()) {
    on<CategoryStatedEvent>(_onCategoryStatedEventToState);
  }

  FutureOr<void> _onCategoryStatedEventToState(
      CategoryStatedEvent event, Emitter<CategoryState> emit) async {
    emit(CategoryLoadingState());

    try {
      final eitherCategory = await getCategoriesUseCase();

      eitherCategory.fold(
          (failure) =>
              emit(const CategoryErrorState(message: "Error From Server")),
          (categories) {
        emit(CategoryLoadedState(categories: categories));
      });
    } catch (e) {
      emit(const CategoryErrorState(message: 'Error'));
    }
  }
}
