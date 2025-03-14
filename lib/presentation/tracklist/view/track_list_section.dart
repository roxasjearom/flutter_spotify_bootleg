import 'package:flutter/material.dart';
import 'package:flutter_spotify_bootleg/domain/models/track.dart';

class TrackListSection extends StatelessWidget {
  const TrackListSection({
    super.key,
    required this.tracks,
    required this.onAddFavoriteClicked,
    required this.onRemoveFavoriteClicked,
  });

  final List<Track> tracks;
  final Function(Track) onAddFavoriteClicked;
  final Function(Track) onRemoveFavoriteClicked;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final track = tracks[index];
          return DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: ListTile(
              onTap: () {},
              tileColor: Colors.black,
              title: Text(
                track.title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              subtitle: Text(
                track.artist,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              trailing: IconButton(
                onPressed: () {
                    if (track.isFavorite) {
                      onRemoveFavoriteClicked(track);
                    } else {
                      onAddFavoriteClicked(track);
                    }
                },
                icon: Icon(
                  track.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          );
        },
        childCount: tracks.length,
      ),
    );
  }
}
