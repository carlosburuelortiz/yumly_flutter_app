import 'package:flutter/material.dart';
import 'package:yumly_flutter_app/domain/entities/entities.dart';
import 'package:yumly_flutter_app/shared/widgets/widgets.dart';

class MealCardList extends StatelessWidget {

  final MealEntity meal;

  const MealCardList({
    super.key,
    required this.meal,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedCard(
      child: Row(
        children: [
          // Imagen del platillo
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              meal.mealThumb ?? '',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey[300],
                  child: Center(child: CircularProgressIndicator()),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey[300],
                  child: Icon(Icons.broken_image, color: Colors.grey),
                );
              },
            ),
          ),
          const SizedBox(width: 12),
          // Texto: nombre + instrucciones breves
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(meal.nameMeal,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text(
                  meal.mealInstructions ?? '',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
