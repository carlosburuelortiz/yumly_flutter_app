part of 'meals_bloc.dart';

sealed class MealsState {}

class MealsInitial extends MealsState {}
class MealsLoading extends MealsState {}
class MealsFetchingSuccessState extends MealsState {
  final MealsEntity mealsEntity;

  MealsFetchingSuccessState({required this.mealsEntity});
}
class MealsFetchingErrorState extends MealsState {
  final String message;

  MealsFetchingErrorState(this.message);
}
class MealsFetchingNotFoundErrorState extends MealsState {
  final String message;

  MealsFetchingNotFoundErrorState(this.message);
}
