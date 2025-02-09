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
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              subtitle: Text(song.artist,
                  style: TextStyle(
                    color: Colors.white,
                  )),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert_rounded,
                  color: Colors.white,
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
