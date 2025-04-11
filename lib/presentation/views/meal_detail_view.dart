import 'package:flutter/material.dart';
import 'package:yumly_flutter_app/domain/entities/entities.dart';
import 'package:yumly_flutter_app/shared/widgets/widgets.dart';

class MealDetailView extends StatelessWidget {
  const MealDetailView({super.key, required this.mealEntity});

  final MealEntity mealEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSilverAppBar(mealEntity: mealEntity),
          CustomSliverToBoxAdapter(mealEntity: mealEntity),
        ],
      ),
    );
  }
}

class CustomSliverToBoxAdapter extends StatelessWidget {
  const CustomSliverToBoxAdapter({
    super.key,
    required this.mealEntity,
  });

  final MealEntity mealEntity;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            PinnedCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ingredients',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  ...(mealEntity.ingredients.isNotEmpty
                      ? mealEntity.ingredients.map(
                        (ingredient) => Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 2.0,
                          ),
                          child: Text('- $ingredient'),
                        ),
                      )
                      : [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 2.0,
                          ),
                          child: Text(
                            'No ingredients available.',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ]),
                ],
              ),
            ),
            const SizedBox(height: 32),
            PinnedCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Instructions',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      mealEntity.mealInstructions?.isNotEmpty == true
                          ? mealEntity.mealInstructions!
                          : 'No instructions available.',
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSilverAppBar extends StatelessWidget {
  const CustomSilverAppBar({
    super.key,
    required this.mealEntity,
  });

  final MealEntity mealEntity;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 250.0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          mealEntity.nameMeal,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                offset: Offset(0, 1),
                blurRadius: 3,
                color: Colors.black54,
              ),
            ],
          ),
        ),
        centerTitle: true,
        collapseMode: CollapseMode.parallax,
        background: Image.network(
          mealEntity.mealThumb ?? '',
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
              color: Colors.grey[200],
              child: Center(child: CircularProgressIndicator()),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[200],
              child: Center(
                child: Icon(
                  Icons.broken_image,
                  size: 100,
                  color: Colors.grey,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
