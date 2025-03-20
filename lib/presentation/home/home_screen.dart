import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_bootleg/domain/repository/favorites_repository.dart';
import 'package:flutter_spotify_bootleg/domain/repository/spotify_repository.dart';
import 'package:flutter_spotify_bootleg/presentation/home/category/category_section.dart';
import 'package:flutter_spotify_bootleg/presentation/home/favorite/bloc/favorite_bloc.dart';
import 'package:flutter_spotify_bootleg/presentation/home/favorite/favorite_section.dart';

import '../../di/service_locator.dart';
import 'album/bloc/album_bloc.dart';
import 'album/album_section.dart';
import 'artist/bloc/artist_bloc.dart';
import 'artist/artist_section.dart';
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
        SizedBox(height: 32),
        BlocProvider(
          create: (_) => CategoryBloc(
            homeRepository: getIt.get<SpotifyRepository>(),
          )..add(CategoryFetched()),
          child: const CategorySection(),
        ),
        SizedBox(height: 8),
        BlocProvider(
          create: (_) => AlbumBloc(
            homeRepository: getIt.get<SpotifyRepository>(),
          )..add(AlbumFetched()),
          child: const AlbumSection(),
        ),
        SizedBox(height: 8),
        BlocProvider(
          create: (_) => ArtistBloc(
            homeRepository: getIt.get<SpotifyRepository>(),
          )..add(ArtistFetched()),
          child: const ArtistSection(),
        ),
        SizedBox(height: 8),
        BlocProvider(
          create: (_) => FavoriteBloc(
            favoritesRepository: getIt.get<FavoritesRepository>(),
          )..add(FavoriteFetched()),
          child: const FavoriteSection(),
        ),
      ],
    ));
  }
}
