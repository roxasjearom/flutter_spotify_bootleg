import 'package:flutter/material.dart';
import 'package:flutter_spotify_bootleg/domain/models/category.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({required this.category, super.key});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return 
    Center(child: SizedBox(
      width: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              category.iconUrl,
              width: 120,
              height: 120,
            ),
            Text(category.name,
            textAlign: TextAlign.center)
          ],
        )
      ))
    ;
  }
}
