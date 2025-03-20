import 'package:flutter/material.dart';
import 'package:flutter_spotify_bootleg/domain/models/category.dart';
import 'package:flutter_spotify_bootleg/presentation/widgets/home_section_item.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({required this.category, super.key});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return HomeSectionItem(imageUrl: category.iconUrl, name: category.name);
  }
}
