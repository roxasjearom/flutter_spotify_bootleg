import 'package:flutter/material.dart';
import 'package:flutter_spotify_bootleg/domain/models/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({required this.category, super.key});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              category.iconUrl,
              width: 120,
              height: 120,
            ),
            Text(category.name)
          ],
        )
      );
  }
}
