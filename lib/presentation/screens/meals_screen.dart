import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:yumly_flutter_app/presentation/blocs/meals_bloc/meals_bloc.dart';
import 'package:yumly_flutter_app/presentation/views/views.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals'),
      ),
      body: BlocConsumer(
        bloc: mealsBloc,
        listener: (context, state) {
        },
        builder: (context, state) {
          if (state is MealsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MealsFetchingSuccessState) {
            final mealList = state.mealsEntity.mealList;
            return MealsView(mealList: mealList);
          } else {
            return NoDataAvailable();
          }
        },
      ),
    );
  }
}
