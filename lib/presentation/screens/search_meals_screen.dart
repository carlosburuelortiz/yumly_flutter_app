import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:yumly_flutter_app/presentation/blocs/search_bloc/search_meal_bloc.dart';
import 'package:yumly_flutter_app/presentation/views/views.dart';
import 'package:yumly_flutter_app/shared/widgets/widgets.dart';

class SearchMealsScreen extends StatefulWidget {
  const SearchMealsScreen({super.key});

  @override
  State<SearchMealsScreen> createState() => _SearchMealsScreenState();
}

class _SearchMealsScreenState extends State<SearchMealsScreen> {
  final SearchMealBloc searchMealsBloc = SearchMealBloc();
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  void _onChangedHandler(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      _callMethod(value);
    });
  }

  void _callMethod(String text) {
    searchMealsBloc.add(
      FetchSearchMealsEvent(query: text),
    );
  }

  @override
  void initState() {
    searchMealsBloc.add(FetchSearchMealsEvent(query: ''));
    super.initState();
  }

  @override
  void dispose() {
    searchMealsBloc.close();
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: null,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(65),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(25, 0, 0, 0),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                controller: _controller,
                onChanged: _onChangedHandler,
                style: TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  hintText: 'Search for dishes...',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 8),
                    child: Icon(Icons.search, color: Colors.grey[700]),
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder(
        bloc: searchMealsBloc,
        builder: (context, state) {
          return switch (state) {
            SearchMealsLoading() => const LoadingView(),
            SearchMealsFetchingSuccessState(:final mealsEntity) => MealsView(
              mealList: mealsEntity.mealList,
              isInfiniteScroll: false,
            ),
            SearchMealsFetchingNotFoundState(:final message) => EmptyState(
              message: message,
              illustrationAsset: 'assets/images/no_dishes.png',
            ),
            _ => EmptyState(
              message:
                  'It seems that something went wrong. Shall we try again?',
              illustrationAsset: 'assets/images/error.png',
            ),
          };
        },
      ),
    );
  }
}
