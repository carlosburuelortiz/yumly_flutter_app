import 'package:flutter/material.dart';
import 'package:yumly_flutter_app/domain/entities/entities.dart';

class MealsView extends StatelessWidget {
  final List<MealEntity> mealList;

  const MealsView({
    super.key,
    required this.mealList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final meal = mealList[index % mealList.length];
        return ListTile(
          title: Text(meal.strMeal),
          subtitle: Text(
            meal.ingredients.length.toString(),
          ),
        );
      },
    );
  }
}
