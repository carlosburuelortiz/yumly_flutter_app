class MealResponse {
  final String idMeal;
  final String strMeal;
  final String? strInstructions;
  final String? strMealThumb;

  MealResponse({
    required this.idMeal,
    required this.strMeal,
    required this.strInstructions,
    required this.strMealThumb,
  });

  factory MealResponse.fromJson(Map<String, dynamic> json) => MealResponse(
    idMeal: json["idMeal"],
    strMeal: json["strMeal"],
    strInstructions: json["strInstructions"] ?? '',
    strMealThumb: json["strMealThumb"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "idMeal": idMeal,
    "strMeal": strMeal,
    "strInstructions": strInstructions,
    "strMealThumb": strMealThumb,
  };
}
