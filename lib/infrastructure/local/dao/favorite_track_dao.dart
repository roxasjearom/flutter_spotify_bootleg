import 'package:floor/floor.dart';
import 'package:flutter_spotify_bootleg/infrastructure/local/entity/favorite_track_entity.dart';

@dao
abstract class FavoriteTrackDao {
  @Query('SELECT * FROM FavoriteTrack')
  Stream<List<FavoriteTrack>> getAllFavoritesStream();

  @Query('SELECT * FROM FavoriteTrack')
  Future<List<FavoriteTrack>> getFavorites();

  @Query('SELECT * FROM FavoriteTrack WHERE id = :id')
  Stream<FavoriteTrack?> getSpecificFavorite(int id);

  @insert
  Future<void> insertFavorite(FavoriteTrack song);

  @Query('DELETE FROM FavoriteTrack where id = :id')
  Future<void> deleteFavorite(String id);
}
