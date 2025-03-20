import 'package:flutter/material.dart';
import 'package:flutter_spotify_bootleg/domain/models/artist.dart';
import 'package:flutter_spotify_bootleg/presentation/widgets/home_section_item.dart';

class ArtistItem extends StatelessWidget {
  const ArtistItem({required this.artist, super.key});

  final Artist artist;

  @override
  Widget build(BuildContext context) {
    return HomeSectionItem(imageUrl: artist.imageUrl, name: artist.name);
  }
}
