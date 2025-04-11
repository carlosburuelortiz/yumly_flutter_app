import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:yumly_flutter_app/presentation/blocs/meal_bloc/meal_bloc.dart';
import 'package:yumly_flutter_app/presentation/views/views.dart';
import 'package:yumly_flutter_app/shared/widgets/widgets.dart';

class MealDetailScreen extends StatefulWidget {
  final String mealId;

  const MealDetailScreen({super.key, required this.mealId});

  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  final MealBloc mealBloc = MealBloc();

  @override
  void initState() {
    mealBloc.add(FetchMealEvent(mealId: widget.mealId));
    super.initState();
  }

  @override
  void dispose() {
    mealBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: mealBloc,
      builder: (context, state) {
        return switch (state) {
          MealsLoading() => const LoadingView(),
          MealFetchingSuccessState(:final mealEntity) => MealDetailView(
            mealEntity: mealEntity,
          ),
          MealFetchingNotFoundErrorState() => Scaffold(
            appBar: AppBar(),
            body: EmptyState(
              message: 'Dish not found',
              illustrationAsset: 'assets/images/no_dishes.png',
              onAction: () {
                mealBloc.add(FetchMealEvent(mealId: widget.mealId));
              },
              actionLabel: 'Try again',
            ),
          ),
          _ => Scaffold(
            appBar: AppBar(),
            body: EmptyState(
              message:
                  'It seems that something went wrong. Shall we try again?',
              illustrationAsset: 'assets/images/error.png',
              onAction: () {
                mealBloc.add(FetchMealEvent(mealId: widget.mealId));
              },
              actionLabel: 'Try again',
            ),
          ),
        };
      },
    );
  }
}
