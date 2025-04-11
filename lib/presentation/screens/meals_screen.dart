import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:yumly_flutter_app/presentation/blocs/meals_bloc/meals_bloc.dart';
import 'package:yumly_flutter_app/presentation/views/views.dart';
import 'package:yumly_flutter_app/shared/widgets/widgets.dart';

class MealsScreen extends StatefulWidget {
  const MealsScreen({super.key});

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  final MealsBloc mealsBloc = MealsBloc();

  @override
  void initState() {
    mealsBloc.add(FetchMealsEvent());
    super.initState();
  }

  @override
  void dispose() {
    mealsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _NameAppTitle(),
        centerTitle: true,
      ),
      body: BlocBuilder(
        bloc: mealsBloc,
        builder: (context, state) {
          return switch (state) {
            MealsLoading() => const LoadingView(),
            MealsFetchingSuccessState(:final mealsEntity) => MealsView(
              mealList: mealsEntity.mealList,
            ),
            MealsFetchingNotFoundErrorState() => EmptyState(
              message: 'No dishes found',
              illustrationAsset: 'assets/images/no_dishes.png',
              onAction: () {
                mealsBloc.add(FetchMealsEvent());
              },
              actionLabel: 'Try again',
            ),
            _ => EmptyState(
              message: 'It seems that something went wrong. Shall we try again?',
              illustrationAsset: 'assets/images/error.png',
              onAction: () {
                mealsBloc.add(FetchMealsEvent());
              },
              actionLabel: 'Try again',
            ),
          };
        },
      ),
    );
  }
}

class _NameAppTitle extends StatelessWidget {
  const _NameAppTitle();

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.titleLarge,
        children: [
          TextSpan(
            text: 'Yum',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const TextSpan(text: 'ly', style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}
