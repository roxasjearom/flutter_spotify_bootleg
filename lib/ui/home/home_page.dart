import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_bootleg/domain/repository/home_repository.dart';
import 'package:flutter_spotify_bootleg/ui/home/category/view/category_list.dart';

import '../../di/service_locator.dart';
import 'category/bloc/category_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider(
          create: (context) => CategoryBloc(
            homeRepository: getIt.get<HomeRepository>(),
          )..add(CategoryFetched()),
          child: const CategorySection(),
        ),
      ),
    );
  }
}
