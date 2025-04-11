import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yumly_flutter_app/domain/entities/entities.dart';
import 'package:yumly_flutter_app/presentation/views/views.dart';

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
        return GestureDetector(
          child: MealCardList(meal: meal),
          onTap: () {
            context.push('/meal/${meal.idMeal}');
          },
        );
      },
    );
  }
}
