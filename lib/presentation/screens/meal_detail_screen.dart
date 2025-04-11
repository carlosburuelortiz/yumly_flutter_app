// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:yumly_flutter_app/shared/widgets/widgets.dart';

class MealDetailScreen extends StatelessWidget {
  final String mealId;

  MealDetailScreen({super.key, required this.mealId});

  final String dishName = 'Spaghetti Carbonara';
  final List<String> ingredients = [
    '200g spaghetti',
    '100g pancetta',
    '2 eggs',
    '50g grated parmesan',
    'Salt & pepper',
    '1 clove garlic',
  ];
  final List<String> instructions = [
    '1. Boil the spaghetti in salted water.',
    '2. Fry pancetta with garlic until crispy.',
    '3. Beat eggs with grated parmesan.',
    '4. Drain pasta and mix with pancetta.',
    '5. Remove from heat, add egg mixture.',
    '6. Stir well and serve with pepper.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(dishName), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Imagen con placeholder
            ClipRRect(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
              child: SizedBox(
                height: 250,
                width: double.infinity,
                child: Image.network(
                  'https://www.themealdb.com/images/media/meals/quuxsx1511476154.jpg/large',
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
            ),

            // Contenido
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  PinnedCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ingredientes',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        ...ingredients.map(
                          (ingredient) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                            child: Text('- $ingredient'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32), // Espacio mayor por la tachuela
                  PinnedCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Instrucciones',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        ...instructions.map(
                          (step) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(step),
                          ),
                        ),
                      ],
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
