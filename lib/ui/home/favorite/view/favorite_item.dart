import 'package:flutter/material.dart';
import 'package:flutter_spotify_bootleg/domain/models/song.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({required this.favorite, super.key});

  final Song favorite;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              "https://i.scdn.co/image/ab67616100005174ae07171f989fb39736674113", //TODO temporary icon only
              width: 120,
              height: 120,
            ),
            Text(favorite.title)
          ],
        )
      );
  }
}
