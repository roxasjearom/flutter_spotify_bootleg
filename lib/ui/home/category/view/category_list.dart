import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_bootleg/ui/home/category/bloc/category_bloc.dart';
import 'package:flutter_spotify_bootleg/ui/home/category/category_item.dart';

class CategoryList extends StatefulWidget{
  const CategoryList({super.key});

  @override
  State<StatefulWidget> createState() => _CategoryListState();
  
}

class _CategoryListState extends State<CategoryList> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder:(context, state) {
        switch (state.status) {
          case CategoryStatus.initial:
            return const Center(child: CircularProgressIndicator());
          case CategoryStatus.success:
            if (state.categories.isEmpty) {
              return const Center(child: Text('no category'));
            }
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return CategoryItem(category: state.categories[index]);
              },
              itemCount: state.categories.length,
            );
          case CategoryStatus.failure:
            return const Center(child: Text('failed to fetch categories'));
        }
      }
      );
  }
  
}