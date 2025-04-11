import 'package:flutter/material.dart';

class PinnedCard extends StatelessWidget {
  final Widget child;

  const PinnedCard({super.key, required this.child});

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
        // Tachuela rotada, sin sombra
        Positioned(
          top: -6,
          right: 6,
          child: Image(
            image: const AssetImage('assets/images/tack.png'),
            width: 32,
            height: 32,
          ),
        ),
      ],
    );
  }
}
