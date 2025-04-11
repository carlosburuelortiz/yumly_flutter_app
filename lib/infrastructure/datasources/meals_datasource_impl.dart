import 'package:dio/dio.dart';
import 'package:yumly_flutter_app/config/constants/error_exception.dart';

import 'package:yumly_flutter_app/domain/datasources/meals_datasource.dart';
import 'package:yumly_flutter_app/domain/entities/entities.dart';
import 'package:yumly_flutter_app/infrastructure/errors/errors.dart';
import 'package:yumly_flutter_app/infrastructure/mappers/mappers.dart';
import 'package:yumly_flutter_app/infrastructure/models/models.dart';

class MealsDatasourceImpl extends MealsDatasource {
  final dio = Dio(
    BaseOptions(baseUrl: 'https://www.themealdb.com/api/json/v1/1'),
  );

  @override
  Future<MealsEntity> getMeals(String name) async {
    try {
      final response = await dio.get(
        '/search.php',
        queryParameters: {'s': name},
      );

      final mealResponse = MealsResponse.fromJson(response.data);
      final mealsEntity = MealMapper.movieResponseToEntity(mealResponse);
      return mealsEntity;
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == ErrorException.kNotFound) {
          throw NotFoundException();
        }
      }
      throw GenericException(message: e.message);
    } catch (e) {
      throw GenericException();
    }
  }
}
