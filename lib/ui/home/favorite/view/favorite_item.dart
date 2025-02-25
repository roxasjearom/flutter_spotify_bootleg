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
            Image.asset(
                'assets/liked_icon.png',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            Text(favorite.title)
          ],
        )
      );
  }
}
