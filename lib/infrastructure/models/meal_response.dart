import 'package:yumly_flutter_app/config/constants/constant.dart';
import 'package:yumly_flutter_app/config/extensions/extension.dart';

class MealResponse {
  final String idMeal;
  final String nameMeal;
  final String? mealInstructions;
  final String? mealThumb;
  final List<String> ingredients;

  MealResponse({
    required this.idMeal,
    required this.nameMeal,
    required this.mealInstructions,
    required this.mealThumb,
    required this.ingredients,
  });

  factory MealResponse.fromJson(Map<String, dynamic> json) {
    final List<String> ingredients = [];

    for (int index = 1; index <= Constant.kMaxIngredients; index++) {
      final ingredientKey = 'strIngredient$index';
      final measureKey = 'strMeasure$index';

      final ingredientValue = json[ingredientKey] as String?;
      final measureValue = json[measureKey] as String?;

      if (ingredientValue.isStringEmpty || measureValue.isStringEmpty) {
        break;
      }
      ingredients.add('$ingredientValue ($measureValue)') ;
    }

    return MealResponse(
      idMeal: json["idMeal"],
      nameMeal: json["strMeal"],
      mealInstructions: json["strInstructions"] ?? '',
      mealThumb: json["strMealThumb"] ?? '',
      ingredients: ingredients,
    );
  }

  Map<String, dynamic> toJson() => {
    "idMeal": idMeal,
    "strMeal": nameMeal,
    "strInstructions": mealInstructions,
    "strMealThumb": mealThumb,
  };
}
