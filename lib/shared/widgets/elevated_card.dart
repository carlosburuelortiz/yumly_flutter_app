import 'package:flutter/material.dart';

class ElevatedCard extends StatelessWidget {
  final Widget child;

  const ElevatedCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Tarjeta de contenido
        Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(padding: const EdgeInsets.all(16.0), child: child),
        ),
      ],
    );
  }
}
