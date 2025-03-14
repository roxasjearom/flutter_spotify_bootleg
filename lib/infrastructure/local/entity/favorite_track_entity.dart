import 'package:floor/floor.dart';

@entity
class FavoriteTrack {
  FavoriteTrack(this.id, this.name, this.artist);

  @primaryKey
  final String id;

  final String name;

  final String artist;
}
