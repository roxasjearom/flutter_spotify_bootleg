import 'package:flutter/material.dart';
import 'package:flutter_spotify_bootleg/domain/models/album.dart';

class AlbumItem extends StatelessWidget {
  const AlbumItem({required this.album, super.key});

  final Album album;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              album.imageUrl,
              width: 120,
              height: 120,
            ),
            Text(album.name)
          ],
        )
      );
  }
}
