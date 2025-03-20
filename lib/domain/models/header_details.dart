import 'package:equatable/equatable.dart';

import 'track.dart';

final class HeaderDetails extends Equatable {
  const HeaderDetails(
      {required this.id,
      required this.name,
      required this.artist,
      required this.imageUrl,
      required this.subHeaderValue,
      required this.tracks});

  final String id;
  final String name;
  final String artist;
  final String imageUrl;
  final String? subHeaderValue;
  final List<Track> tracks;

  @override
  List<Object> get props => [id, name, imageUrl, tracks];
}
