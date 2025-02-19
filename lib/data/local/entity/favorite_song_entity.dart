import 'package:floor/floor.dart';

@entity
class FavoriteSong {
  FavoriteSong(this.id, this.name, this.artist);

  @primaryKey
  final String id;

  final String name;

  final String artist;
}
