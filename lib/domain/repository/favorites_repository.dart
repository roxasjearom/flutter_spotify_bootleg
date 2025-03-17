import 'package:flutter_spotify_bootleg/domain/models/track.dart';

abstract interface class FavoritesRepository {
  Stream<List<Track>> getFavoritesStream();
  Future<void> addToFavorites(Track track);
  Future<void> removeFromFavorites(Track track);
}
