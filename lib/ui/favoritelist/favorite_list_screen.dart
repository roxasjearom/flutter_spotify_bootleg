import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_bootleg/data/local/dao/favorite_song_dao.dart';
import 'package:flutter_spotify_bootleg/di/service_locator.dart';
import 'package:flutter_spotify_bootleg/domain/repository/home_repository.dart';
import 'package:flutter_spotify_bootleg/ui/favoritelist/bloc/favorite_list_bloc.dart';
import 'package:flutter_spotify_bootleg/ui/songlist/view/custom_appbar/sliver_custom_appbar.dart';
import 'package:flutter_spotify_bootleg/ui/songlist/view/song_list_section.dart';

class FavoriteListScreen extends StatelessWidget {
  const FavoriteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => FavoriteListBloc(
              homeRepository: getIt.get<HomeRepository>(),
              favoriteSongDao: getIt.get<FavoriteSongDao>(),
            )..add(FavoriteListFetched()),
        child: _FavoriteListPage());
  }
}

class _FavoriteListPage extends StatefulWidget {
  const _FavoriteListPage();

  @override
  State<StatefulWidget> createState() => _FavoriteListPageState();
}

class _FavoriteListPageState extends State<_FavoriteListPage> {
  late ScrollController _scrollController;

  late double maxAppBarHeight;
  late double minAppBarHeight;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    maxAppBarHeight = MediaQuery.of(context).size.height * 0.45;
    minAppBarHeight = MediaQuery.of(context).padding.top +
        MediaQuery.of(context).size.height * 0.12;

    return BlocBuilder<FavoriteListBloc, FavoriteListState>(
        builder: (context, state) {
      return Scaffold(
        body: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).colorScheme.surface,
                  Colors.black,
                ],
                stops: [
                  0,
                  0.7
                ]),
          ),
          child: Stack(
            children: [
              CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverCustomeAppBar(
                    title: "Favorites",
                    imageUrl: "https://i.scdn.co/image/ab67616d0000b2732c5b24ecfa39523a75c993c4", //TODO update this
                    maxAppBarHeight: maxAppBarHeight,
                    minAppBarHeight: minAppBarHeight,
                  ),
                  SongListSection(
                    songs: state.songs,
                    onAddFavoriteClicked: (song) {
                      context.read<FavoriteListBloc>().add(FavoriteSongAdded(song));
                    },
                    onRemoveFavoriteClicked: (song) {
                      context
                          .read<FavoriteListBloc>()
                          .add(FavoriteSongRemoved(song));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
