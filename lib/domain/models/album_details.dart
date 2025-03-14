import 'package:equatable/equatable.dart';

import 'track.dart';

final class AlbumDetails extends Equatable {
  const AlbumDetails(
      {required this.id,
      required this.name,
      required this.artist,
      required this.imageUrl,
      required this.tracks});

  final String id;
  final String name;
  final String artist;
  final String imageUrl;
  final List<Track> tracks;

  @override
  List<Object> get props => [id, name, imageUrl, tracks];
}
