class MealEntity {
  final String idMeal;
  final String strMeal;
  final String? strInstructions;
  final String? strMealThumb;
  final List<String> ingredients;

  MealEntity({
    required this.idMeal,
    required this.strMeal,
    required this.strInstructions,
    required this.strMealThumb,
    required this.ingredients,
  });
}
