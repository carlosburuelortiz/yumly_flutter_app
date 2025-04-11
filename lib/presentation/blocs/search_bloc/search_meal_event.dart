part of 'search_meal_bloc.dart';

abstract class SearchMealsEvent {}

class FetchSearchMealsEvent extends SearchMealsEvent {
  final String query;

  FetchSearchMealsEvent({required this.query});
}
