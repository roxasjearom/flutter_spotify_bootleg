import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_bootleg/domain/repository/favorites_repository.dart';
import 'package:flutter_spotify_bootleg/di/service_locator.dart';
import 'package:flutter_spotify_bootleg/domain/repository/spotify_repository.dart';
import 'package:flutter_spotify_bootleg/presentation/tracklist/album_info_section.dart';
import 'package:flutter_spotify_bootleg/presentation/widgets/custom_appbar/sliver_custom_appbar.dart';
import 'package:flutter_spotify_bootleg/presentation/tracklist/play_pause_button.dart';
import 'package:flutter_spotify_bootleg/presentation/tracklist/track_list_section.dart';

import 'bloc/track_list_bloc.dart';

class TrackListScreen extends StatelessWidget {
  const TrackListScreen({super.key, required this.id, required this.sourceType});

  final String id;
  final SourceType sourceType;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TrackListBloc(
              id: id,
              sourceType: sourceType,
              spotifyRepository: getIt.get<SpotifyRepository>(),
              favoritesRepository: getIt.get<FavoritesRepository>(),
            )..add(TrackListFetched(id, sourceType)),
        child: _TrackListPage());
  }
}

class _TrackListPage extends StatefulWidget {
  const _TrackListPage();

  @override
  State<StatefulWidget> createState() => _TrackListPageState();
}

class _TrackListPageState extends State<_TrackListPage> {
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
    return BlocBuilder<TrackListBloc, TrackListState>(builder: (context, state) {
      switch (state.status) {
        case TrackListStatus.initial:
          return const Center(child: CircularProgressIndicator());

        case TrackListStatus.success:
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
                      TrackListSection(
                        tracks: state.tracks,
                        onAddFavoriteClicked: (track) {
                          context
                              .read<TrackListBloc>()
                              .add(FavoriteTrackAdded(track));
                        },
                        onRemoveFavoriteClicked: (track) {
                          context
                              .read<TrackListBloc>()
                              .add(FavoriteTrackRemoved(track));
                        },
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

        case TrackListStatus.failure:
          return Center(
              child: Text(
            'Failed to fetch details',
            style: Theme.of(context).textTheme.bodyLarge,
          ));
      }
    });
  }
}
