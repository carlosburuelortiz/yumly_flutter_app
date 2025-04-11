part of 'meal_bloc.dart';

abstract class MealEvent {}

class FetchMealEvent extends MealEvent {
  String mealId;
  FetchMealEvent({required this.mealId});
}
