part of '../category/category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitialState extends CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategoryLoadedState extends CategoryState {
  final List<Category> categories;

  const CategoryLoadedState({required this.categories});

  @override
  List<Object> get props => [categories];
}

class CategoryErrorState extends CategoryState {
  final String message;

  const CategoryErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
