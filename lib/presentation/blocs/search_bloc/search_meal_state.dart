part of 'search_meal_bloc.dart';

sealed class SearchMealsState {}

class SearchMealsInitial extends SearchMealsState {}
class SearchMealsLoading extends SearchMealsState {}
class SearchMealsFetchingSuccessState extends SearchMealsState {
  final MealsEntity mealsEntity;

  SearchMealsFetchingSuccessState({required this.mealsEntity});
}
class SearchMealsFetchingNotFoundState extends SearchMealsState {
  final String message;

  SearchMealsFetchingNotFoundState(this.message);
}
class SearchMealsFetchingErrortate extends SearchMealsState {
  final String message;

  SearchMealsFetchingErrortate(this.message);
}
