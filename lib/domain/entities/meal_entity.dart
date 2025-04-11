class MealEntity {
  final String idMeal;
  final String nameMeal;
  final String? mealInstructions;
  final String? mealThumb;
  final List<String> ingredients;

  MealEntity({
    required this.idMeal,
    required this.nameMeal,
    required this.mealInstructions,
    required this.mealThumb,
    required this.ingredients,
  });
}
