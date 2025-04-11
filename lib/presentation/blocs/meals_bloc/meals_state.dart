part of 'meals_bloc.dart';

abstract class MealsState {}

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
// class MealsEmpty extends MealsState {}
// class MealsNoInternet extends MealsState {}
// class MealsNoData extends MealsState {}
// class MealsNoResults extends MealsState {}
