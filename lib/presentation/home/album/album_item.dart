import 'package:flutter/material.dart';
import 'package:flutter_spotify_bootleg/domain/models/album.dart';
import 'package:flutter_spotify_bootleg/presentation/widgets/home_section_item.dart';

class AlbumItem extends StatelessWidget {
  const AlbumItem({required this.album, super.key});

  final Album album;

  @override
  Widget build(BuildContext context) {
    return HomeSectionItem(imageUrl: album.imageUrl, name: album.name);
  }
}
