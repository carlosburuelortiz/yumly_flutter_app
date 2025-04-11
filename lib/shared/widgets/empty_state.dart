import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final String message;
  final String? illustrationAsset;
  final VoidCallback? onAction;
  final String? actionLabel;
  final bool needNavigate;

  const EmptyState({
    super.key,
    required this.message,
    this.illustrationAsset,
    this.onAction,
    this.actionLabel,
    this.needNavigate = false,
  });

  @override
  Widget build(BuildContext context) {
    final imageWidget =
        illustrationAsset != null
            ? Image.asset(illustrationAsset!, height: 180)
            : null;

    final body = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (imageWidget != null) imageWidget,
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: Colors.grey[700]),
            ),
          ),
          if (onAction != null && actionLabel != null) ...[
            const SizedBox(height: 24),
            FilledButton(onPressed: onAction, child: Text(actionLabel!)),
          ],
        ],
      ),
    );

    return needNavigate ? Scaffold(appBar: AppBar(), body: body) : body;
  }
}
