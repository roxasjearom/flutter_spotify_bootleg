import 'package:equatable/equatable.dart';

final class Track extends Equatable {
  const Track(
      {required this.id,
      required this.title,
      required this.artist,
      this.isFavorite = false});

  final String id;
  final String title;
  final String artist;
  final bool isFavorite;

  @override
  List<Object> get props => [id, title, artist, isFavorite];
}
