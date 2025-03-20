import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_bootleg/di/service_locator.dart';
import 'package:flutter_spotify_bootleg/domain/models/category.dart';
import 'package:flutter_spotify_bootleg/domain/repository/spotify_repository.dart';
import 'package:flutter_spotify_bootleg/presentation/categorylist/bloc/category_list_bloc.dart';
import 'package:flutter_spotify_bootleg/presentation/categorylist/category_list_item.dart';
import 'package:flutter_spotify_bootleg/presentation/playlist/playlist_screen.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoryListBloc(homeRepository: getIt.get<SpotifyRepository>())
            ..add(CategoryListFetched()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Categories'),
        ),
        body: BlocBuilder<CategoryListBloc, CategoryListState>(
          builder: (context, state) {
            switch (state.status) {
              case CategoryListStatus.initial:
                return const Center(child: CircularProgressIndicator());

              case CategoryListStatus.success:
                if (state.categories.isEmpty) {
                  return const Center(child: Text('No category to show'));
                }
                return CategoryListGridView(categories: state.categories);

              case CategoryListStatus.failure:
                return const Center(child: Text('Failed to fetch categories'));
            }
          },
        ),
      ),
    );
  }
}

class CategoryListGridView extends StatelessWidget {
  const CategoryListGridView({
    super.key,
    required this.categories,
  });

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: categories.length,
      scrollDirection: Axis.vertical,
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
            child: CategoryListItem(category: categories[index]));
      },
    );
  }
}
