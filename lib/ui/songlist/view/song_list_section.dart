import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_bootleg/domain/models/song.dart';
import 'package:flutter_spotify_bootleg/ui/songlist/bloc/song_list_bloc.dart';

class SongListSection extends StatelessWidget {
  const SongListSection({
    super.key,
    required this.songs,
  });

  final List<Song> songs;

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
                      context.read<SongListBloc>().add(FavoriteSongRemoved(song));
                    } else {
                      context.read<SongListBloc>().add(FavoriteSongAdded(song));
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
