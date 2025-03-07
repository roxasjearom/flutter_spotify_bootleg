import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_bootleg/di/service_locator.dart';
import 'package:flutter_spotify_bootleg/domain/models/playlist.dart';
import 'package:flutter_spotify_bootleg/domain/repository/spotify_repository.dart';
import 'package:flutter_spotify_bootleg/presentation/playlist/bloc/playlist_bloc.dart';
import 'package:flutter_spotify_bootleg/presentation/playlist/view/playlist_item.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlaylistBloc(homeRepository: getIt.get<SpotifyRepository>())..add(PlaylistFetched()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Playlists'),
          actions: [
            BlocBuilder<PlaylistBloc, PlaylistState>(
              builder: (context, state) {
                return IconButton(
                  icon: Icon(
                    state.isGridMode ? Icons.list : Icons.grid_view,
                  ),
                  onPressed: () {
                    context.read<PlaylistBloc>().add(ToggleViewMode());
                  },
                );
              },
            ),
          ],
        ),
        body: BlocBuilder<PlaylistBloc, PlaylistState>(
          builder: (context, state) {
            if (state.playlists.isEmpty) {
              return Center(child: CircularProgressIndicator());
            } else {
              if (state.isGridMode) {
                return PlaylistGridView(playlists: state.playlists);
              } else {
                return PlaylistListView(playlists: state.playlists);
              }
            }
          },
        ),
      ),
    );
  }
}

class PlaylistGridView extends StatelessWidget {
  const PlaylistGridView({
    super.key,
    required this.playlists,
  });

  final List<Playlist> playlists;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: playlists.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return PlaylistGridItem(playlist: playlists[index]);
        },
      );
  }
}

class PlaylistListView extends StatelessWidget {
  const PlaylistListView({
    super.key,
    required this.playlists,
  });

  final List<Playlist> playlists;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return PlaylistListItem(playlist: playlists[index]);
        },
        itemCount: playlists.length,
      );
  }
}
