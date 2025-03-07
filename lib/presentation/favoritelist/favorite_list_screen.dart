import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_bootleg/infrastructure/local/dao/favorite_song_dao.dart';
import 'package:flutter_spotify_bootleg/di/service_locator.dart';
import 'package:flutter_spotify_bootleg/domain/repository/home_repository.dart';
import 'package:flutter_spotify_bootleg/presentation/favoritelist/bloc/favorite_list_bloc.dart';
import 'package:flutter_spotify_bootleg/presentation/songlist/view/song_list_section.dart';
import 'package:flutter_spotify_bootleg/presentation/theme/colors.dart';

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
                  SliverAppBar(
                    expandedHeight: 220,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text('Favorites'),
                      centerTitle: false,
                      background: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              spotifyGrey,
                              spotifyBlack,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SongListSection(
                    songs: state.songs,
                    onAddFavoriteClicked: (song) {
                      context
                          .read<FavoriteListBloc>()
                          .add(FavoriteSongAdded(song));
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
