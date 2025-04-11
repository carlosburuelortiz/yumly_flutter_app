import 'package:yumly_flutter_app/domain/entities/entities.dart';
import 'package:yumly_flutter_app/infrastructure/models/models.dart';

class MealMapper {
  static MealsEntity movieResponseToEntity(MealsResponse mealsResponse) {
    return MealsEntity(
      mealList:
          mealsResponse.mealList
              .map(
                (meal) => MealEntity(
                  idMeal: meal.idMeal,
                  strMeal: meal.strMeal,
                  strInstructions: meal.strInstructions,
                  strMealThumb: meal.strMealThumb,
                ),
              )
              .toList(),
    );
  }
}
