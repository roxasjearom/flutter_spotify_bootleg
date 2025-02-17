import 'package:flutter/material.dart';

class FixedAppBar extends StatelessWidget {
  const FixedAppBar({
    super.key,
    required this.title,
    required this.titleOpacity,
  });

  final String title;
  final double titleOpacity;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.ideographic,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back),
          color: Theme.of(context).colorScheme.onSurface,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        const SizedBox(width: 16),
        AnimatedOpacity(
          opacity: titleOpacity.clamp(0, 1),
          duration: const Duration(milliseconds: 100),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ],
    );
  }
}
