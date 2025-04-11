import 'package:yumly_flutter_app/domain/datasources/meals_datasource.dart';
import 'package:yumly_flutter_app/domain/entities/meal_entity.dart';
import 'package:yumly_flutter_app/domain/entities/meals_entity.dart';
import 'package:yumly_flutter_app/domain/repositories/meals_respository.dart';

class MealsRepositoryImpl extends MealsRespository{
  final MealsDatasource mealsDatasource;

  MealsRepositoryImpl({required this.mealsDatasource});

  @override
  Future<MealsEntity> getMeals([String name = '']) {
    return mealsDatasource.getMeals(name);
  }

  @override
  Future<MealEntity?> getMealById(String mealId) {
    return mealsDatasource.getMealById(mealId);
  }
}
