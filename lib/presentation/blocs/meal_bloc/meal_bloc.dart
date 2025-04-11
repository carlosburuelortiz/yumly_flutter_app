import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:yumly_flutter_app/domain/entities/entities.dart';
import 'package:yumly_flutter_app/infrastructure/datasources/meals_datasource_impl.dart';
import 'package:yumly_flutter_app/infrastructure/repositories/meals_repository_impl.dart';

part 'meal_event.dart';
part 'meal_state.dart';

class MealBloc extends Bloc<MealEvent, MealState> {
  MealBloc() : super(MealInitial()) {
    on<FetchMealEvent>(fetchMealById);
  }

  FutureOr<void> fetchMealById(
    FetchMealEvent event,
    Emitter<MealState> emit,
  ) async {
    emit(MealsLoading());
    try {
      // ! Simulate network delay
      // await Future.delayed(const Duration(seconds: 2));
      final mealsDatasource = MealsDatasourceImpl();
      final repository = MealsRepositoryImpl(mealsDatasource: mealsDatasource);

      final meal = await repository.getMealById(event.mealId);
      if (meal == null) {
        emit(MealFetchingNotFoundErrorState(''));
      }
      emit(MealFetchingSuccessState(mealEntity: meal!));
    } catch (e) {
      emit(MealFetchingErrorState(e.toString()));
    }
  }
}
