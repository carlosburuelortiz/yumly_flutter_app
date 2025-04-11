import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:yumly_flutter_app/domain/entities/entities.dart';
import 'package:yumly_flutter_app/presentation/views/views.dart';

class MealsView extends StatelessWidget {
  final List<MealEntity> mealList;
  final bool isInfiniteScroll;

  const MealsView({
    super.key,
    required this.mealList,
    this.isInfiniteScroll = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: isInfiniteScroll ? null : mealList.length,
      itemBuilder: (context, index) {
        final infiniteIndex = isInfiniteScroll ? index % mealList.length : index;
        final meal = mealList[infiniteIndex];
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
