import 'package:flutter/material.dart';

class HomeSectionItem extends StatelessWidget {
  final String imageUrl;
  final String name;

  const HomeSectionItem(
      {required this.imageUrl, required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
          Text(name, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
