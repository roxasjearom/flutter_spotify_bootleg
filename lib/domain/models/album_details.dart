import 'package:equatable/equatable.dart';

import 'song.dart';

final class AlbumDetails extends Equatable {
  const AlbumDetails(
      {required this.id,
      required this.name,
      required this.artist,
      required this.imageUrl,
      required this.songs});

  final String id;
  final String name;
  final String artist;
  final String imageUrl;
  final List<Song> songs;

  @override
  List<Object> get props => [id, name, imageUrl, songs];
}
