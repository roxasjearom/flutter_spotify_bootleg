import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_bootleg/domain/enumerations/source_type.dart';
import 'package:flutter_spotify_bootleg/domain/models/artist.dart';
import 'package:flutter_spotify_bootleg/presentation/tracklist/track_list_screen.dart';

import 'bloc/artist_bloc.dart';
import 'artist_item.dart';

class ArtistSection extends StatelessWidget {
  const ArtistSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArtistBloc, ArtistState>(builder: (context, state) {
      switch (state.status) {
        case ArtistStatus.initial:
          return const Center(child: CircularProgressIndicator());

        case ArtistStatus.success:
          if (state.artists.isEmpty) {
            return const Center(child: Text('No artist to show'));
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Artists",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              ArtistList(artists: state.artists),
            ],
          );

        case ArtistStatus.failure:
          return const Center(child: Text('Failed to fetch artists'));
      }
    });
  }
}

class ArtistList extends StatelessWidget {
  const ArtistList({
    super.key,
    required this.artists,
  });

  final List<Artist> artists;

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
                                id: artists[index].id,
                                sourceType: SourceType.artist,
                              )),
                    )
                  },
              child: ArtistItem(artist: artists[index]));
        },
        itemCount: artists.length,
      ),
    );
  }
}
