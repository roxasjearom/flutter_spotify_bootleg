import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_bootleg/domain/repository/home_repository.dart';
import 'package:flutter_spotify_bootleg/ui/home/category/view/category_section.dart';

import '../../di/service_locator.dart';
import 'album/bloc/album_bloc.dart';
import 'album/view/album_section.dart';
import 'artist/bloc/artist_bloc.dart';
import 'artist/view/artist_section.dart';
import 'category/bloc/category_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Padding(padding: const EdgeInsets.all(12), child: _homeSectionList()),
    );
  }

  Widget _homeSectionList() {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocProvider(
          create: (_) => CategoryBloc(
            homeRepository: getIt.get<HomeRepository>(),
          )..add(CategoryFetched()),
          child: const CategorySection(),
        ),
        SizedBox(height: 8),
        BlocProvider(
          create: (_) => AlbumBloc(
            homeRepository: getIt.get<HomeRepository>(),
          )..add(AlbumFetched()),
          child: const AlbumSection(),
        ),
        SizedBox(height: 8),
        BlocProvider(
          create: (_) => ArtistBloc(
            homeRepository: getIt.get<HomeRepository>(),
          )..add(ArtistFetched()),
          child: const ArtistSection(),
        ),
      ],
    ));
  }
}
