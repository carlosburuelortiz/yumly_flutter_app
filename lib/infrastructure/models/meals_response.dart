import 'package:yumly_flutter_app/infrastructure/models/models.dart';

class MealsResponse {
  final List<MealResponse> mealList;

  MealsResponse({required this.mealList});

  factory MealsResponse.fromJson(Map<String, dynamic> json) => MealsResponse(
    mealList: List<MealResponse>.from(
      json['meals'].map((meal) => MealResponse.fromJson(meal)),
    ),
  );
}
