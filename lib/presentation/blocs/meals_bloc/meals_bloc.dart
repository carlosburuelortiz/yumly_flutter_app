import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumly_flutter_app/domain/entities/entities.dart';
import 'package:yumly_flutter_app/infrastructure/datasources/meals_datasource_impl.dart';
import 'package:yumly_flutter_app/infrastructure/repositories/meals_repository_impl.dart';

part 'meals_event.dart';
part 'meals_state.dart';

class MealsBloc extends Bloc<MealsEvent, MealsState> {
  MealsBloc() : super(MealsInitial()) {
    on<FetchMealsEvent>(fetchMeals);
  }

  FutureOr<void> fetchMeals(
    FetchMealsEvent event,
    Emitter<MealsState> emit,
  ) async {
    emit(MealsLoading());
    try {
      // ! Simulate network delay
      await Future.delayed(const Duration(seconds: 2));
      // ! Create registry
      final mealsDatasource = MealsDatasourceImpl();
      final repository = MealsRepositoryImpl(mealsDatasource: mealsDatasource);
      final meals = await repository.getMeals('spanish');
      
      emit(MealsFetchingSuccessState(mealsEntity: meals));
    } catch (e) {
      emit(MealsFetchingErrorState(e.toString()));
    }
  }
}
