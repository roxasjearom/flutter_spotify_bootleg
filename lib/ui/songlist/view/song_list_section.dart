import 'package:flutter/material.dart';
import 'package:flutter_spotify_bootleg/domain/models/song.dart';

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
                onPressed: () {},
                icon: Icon(
                  Icons.favorite,
                  color: Theme.of(context).colorScheme.primary,
                  fill: 1.0,
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
