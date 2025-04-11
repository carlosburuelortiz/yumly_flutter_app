import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yumly_flutter_app/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const MealsScreen()),
    GoRoute(
      path: '/meal/:id',
      pageBuilder: (context, state) {
        final mealId = state.pathParameters['id'] ?? '';
        return CustomTransitionPage(
          key: state.pageKey,
          child: MealDetailScreen(mealId: mealId),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
    ),
  ],
);
