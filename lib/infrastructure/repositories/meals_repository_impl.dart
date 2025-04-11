import 'package:yumly_flutter_app/domain/datasources/meals_datasource.dart';
import 'package:yumly_flutter_app/domain/entities/entities.dart';
import 'package:yumly_flutter_app/domain/repositories/meals_respository.dart';

class MealsRepositoryImpl extends MealsRespository{
  final MealsDatasource mealsDatasource;

  MealsRepositoryImpl({required this.mealsDatasource});

  @override
  Future<MealsEntity> getMeals([String query = '']) {
    return mealsDatasource.getMeals(query);
  }

  @override
  Future<MealEntity?> getMealById(String mealId) {
    return mealsDatasource.getMealById(mealId);
  }
}
