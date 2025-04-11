part of 'meal_bloc.dart';

sealed class MealState {}

class MealInitial extends MealState {}
class MealsLoading extends MealState {}
class MealFetchingSuccessState extends MealState {
  final MealEntity mealEntity;

  MealFetchingSuccessState({required this.mealEntity});
}
class MealFetchingErrorState extends MealState {
  final String message;

  MealFetchingErrorState(this.message);
}
class MealFetchingNotFoundErrorState extends MealState {
  final String message;

  MealFetchingNotFoundErrorState(this.message);
}
