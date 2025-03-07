import 'package:flutter/material.dart';
import 'package:flutter_spotify_bootleg/domain/models/models.dart';

class PlaylistGridItem extends StatelessWidget {
  const PlaylistGridItem({required this.playlist, super.key});

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return 
    Center(child: SizedBox(
      width: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              playlist.imageUrl,
              width: 120,
              height: 120,
            ),
            Text(playlist.name,
            textAlign: TextAlign.center)
          ],
        )
      ))
    ;
  }
}

class PlaylistListItem extends StatelessWidget {
  const PlaylistListItem({required this.playlist, super.key});

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        playlist.imageUrl,
        width: 48,
        height: 48,
        fit: BoxFit.cover,
      ),
      title: Text(playlist.name),
    );
  }
}
