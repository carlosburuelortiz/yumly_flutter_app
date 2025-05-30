import 'package:yumly_flutter_app/domain/entities/entities.dart';

abstract class MealsDatasource {
  Future<MealsEntity> getMeals(String query);
  Future<MealEntity?> getMealById(String mealId);
}
