import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_bootleg/data/local/dao/favorite_song_dao.dart';
import 'package:flutter_spotify_bootleg/di/service_locator.dart';
import 'package:flutter_spotify_bootleg/domain/repository/home_repository.dart';
import 'package:flutter_spotify_bootleg/ui/songlist/view/album_info_section.dart';
import 'package:flutter_spotify_bootleg/ui/songlist/view/custom_appbar/sliver_custom_appbar.dart';
import 'package:flutter_spotify_bootleg/ui/songlist/view/play_button.dart';
import 'package:flutter_spotify_bootleg/ui/songlist/view/song_list_section.dart';

import 'bloc/song_list_bloc.dart';

class SongListScreen extends StatelessWidget {
  const SongListScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => SongListBloc(
              homeRepository: getIt.get<HomeRepository>(),
              favoriteSongDao: getIt.get<FavoriteSongDao>(),
            )..add(SongListFetched(id)),
        child: _SongListPage());
  }
}

class _SongListPage extends StatefulWidget {
  const _SongListPage();

  @override
  State<StatefulWidget> createState() => _SongListPageState();
}

class _SongListPageState extends State<_SongListPage> {
  late ScrollController _scrollController;

  late double maxAppBarHeight;
  late double minAppBarHeight;
  late double playPauseButtonSize;
  late double infoBoxHeight;

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
    playPauseButtonSize = (MediaQuery.of(context).size.width / 320) * 50 > 80
        ? 80
        : (MediaQuery.of(context).size.width / 320) * 50;
    infoBoxHeight = 160;
    return BlocBuilder<SongListBloc, SongListState>(builder: (context, state) {
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
                    title: state.name,
                    imageUrl: state.imageUrl,
                    maxAppBarHeight: maxAppBarHeight,
                    minAppBarHeight: minAppBarHeight,
                  ),
                  AlbumInfoSection(
                      title: state.name,
                      imageUrl: state.imageUrl,
                      artist: state.artist,
                      infoBoxHeight: infoBoxHeight),
                  SongListSection(
                    songs: state.songs,
                  ),
                ],
              ),
              PlayPauseButton(
                scrollController: _scrollController,
                maxAppBarHeight: maxAppBarHeight,
                minAppBarHeight: minAppBarHeight,
                playPauseButtonSize: playPauseButtonSize,
                infoBoxHeight: infoBoxHeight,
              ),
            ],
          ),
        ),
      );
    });
  }
}
