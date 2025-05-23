import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_bootleg/domain/enumerations/source_type.dart';
import 'package:flutter_spotify_bootleg/domain/models/album.dart';
import 'package:flutter_spotify_bootleg/presentation/tracklist/track_list_screen.dart';

import 'bloc/album_bloc.dart';
import 'album_item.dart';

class AlbumSection extends StatelessWidget {
  const AlbumSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlbumBloc, AlbumState>(builder: (context, state) {
      switch (state.status) {
        case AlbumStatus.initial:
          return const Center(child: CircularProgressIndicator());

        case AlbumStatus.success:
          if (state.albums.isEmpty) {
            return const Center(child: Text('No album to show'));
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Albums",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              AlbumList(albums: state.albums),
            ],
          );

        case AlbumStatus.failure:
          return const Center(child: Text('Failed to fetch albums'));
      }
    });
  }
}

class AlbumList extends StatelessWidget {
  const AlbumList({
    super.key,
    required this.albums,
  });

  final List<Album> albums;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TrackListScreen(
                                id: albums[index].id,
                                sourceType: SourceType.album,
                              )),
                    )
                  },
              child: AlbumItem(album: albums[index]));
        },
        itemCount: albums.length,
      ),
    );
  }
}
