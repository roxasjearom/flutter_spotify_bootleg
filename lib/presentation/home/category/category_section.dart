import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_bootleg/presentation/categorylist/category_list_screen.dart';
import 'package:flutter_spotify_bootleg/presentation/home/category/bloc/category_bloc.dart';
import 'package:flutter_spotify_bootleg/presentation/home/category/category_item.dart';
import 'package:flutter_spotify_bootleg/presentation/playlist/playlist_screen.dart';

import '../../../domain/models/models.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({super.key});

  @override
  State<StatefulWidget> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
      switch (state.status) {
        case CategoryStatus.initial:
          return const Center(child: CircularProgressIndicator());

        case CategoryStatus.success:
          if (state.categories.isEmpty) {
            return const Center(child: Text('No category to show'));
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderSection(),
              SizedBox(height: 8),
              CategoryList(categories: state.categories),
            ],
          );

        case CategoryStatus.failure:
          return const Center(child: Text('Failed to fetch categories'));
      }
    });
  }
}

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
    required this.categories,
  });

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PlaylistScreen(categoryId: categories[index].id)),
                    )
                  },
              child: CategoryItem(category: categories[index]));
        },
        itemCount: categories.length,
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Category",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            )),
        TextButton(
            onPressed: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CategoryListScreen()),
                    );
            },
            child: Text("Show all"))
      ],
    );
  }
}
