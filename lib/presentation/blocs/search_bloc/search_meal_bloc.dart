import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:yumly_flutter_app/domain/entities/entities.dart';
import 'package:yumly_flutter_app/infrastructure/datasources/meals_datasource_impl.dart';
import 'package:yumly_flutter_app/infrastructure/errors/errors.dart';
import 'package:yumly_flutter_app/infrastructure/repositories/meals_repository_impl.dart';

part 'search_meal_event.dart';
part 'search_meal_state.dart';

class SearchMealBloc extends Bloc<SearchMealsEvent, SearchMealsState> {
  SearchMealBloc() : super(SearchMealsInitial()) {
    on<FetchSearchMealsEvent>(fetchMeals);
  }

  FutureOr<void> fetchMeals(
    FetchSearchMealsEvent event,
    Emitter<SearchMealsState> emit,
  ) async {
    try {
      emit(SearchMealsLoading());

      final query = event.query;
      final mealsDatasource = MealsDatasourceImpl();
      final repository = MealsRepositoryImpl(mealsDatasource: mealsDatasource);

      final meals = await repository.getMeals(query);

      if (meals.mealList.isEmpty) {
        emit(SearchMealsFetchingNotFoundState('No meals found'));
        return;
      }

      emit(SearchMealsFetchingSuccessState(mealsEntity: meals));
    } on NotFoundException catch(e) {
      emit(SearchMealsFetchingErrortate(e.toString()));
    } catch (e) {
      emit(SearchMealsFetchingErrortate(e.toString()));
    }
  }
}
