import 'package:flutter/material.dart';
import 'package:flutter_spotify_bootleg/domain/models/song.dart';

class SongListSection extends StatelessWidget {
  const SongListSection({
    super.key,
    required this.songs,
    required this.onAddFavoriteClicked,
    required this.onRemoveFavoriteClicked,
  });

  final List<Song> songs;
  final Function(Song) onAddFavoriteClicked;
  final Function(Song) onRemoveFavoriteClicked;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final song = songs[index];
          return DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: ListTile(
              onTap: () {},
              tileColor: Colors.black,
              title: Text(
                song.title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              subtitle: Text(
                song.artist,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              trailing: IconButton(
                onPressed: () {
                    if (song.isFavorite) {
                      onRemoveFavoriteClicked(song);
                    } else {
                      onAddFavoriteClicked(song);
                    }
                },
                icon: Icon(
                  song.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          );
        },
        childCount: songs.length,
      ),
    );
  }
}
