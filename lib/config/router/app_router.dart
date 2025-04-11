import 'package:go_router/go_router.dart';
import 'package:yumly_flutter_app/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const MealsScreen()),
    GoRoute(
      path: '/meal/:id',
      builder: (context, state) {
        final mealId = state.pathParameters['id'] ?? '';
        return MealDetailScreen(mealId: mealId);
      } 
    ),
  ],
);
