import 'package:flutter/material.dart';
import 'package:flutter_spotify_bootleg/domain/models/artist.dart';

class ArtistItem extends StatelessWidget {
  const ArtistItem({required this.artist, super.key});

  final Artist artist;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              artist.imageUrl,
              width: 120,
              height: 120,
            ),
            Text(artist.name)
          ],
        ));
  }
}
