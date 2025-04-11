import 'package:yumly_flutter_app/domain/entities/entities.dart';

abstract class MealsRespository {
  Future<MealsEntity> getMeals(String name);
}
