import 'package:floor/floor.dart';
import 'package:flutter_spotify_bootleg/data/local/entity/favorite_song_entity.dart';

@dao
abstract class FavoriteSongDao {
  @Query('SELECT * FROM FavoriteSong')
  Stream<List<FavoriteSong>> getAllFavorites(); //Might delete this

  @Query('SELECT * FROM FavoriteSong')
  Future<List<FavoriteSong>> getFavorites();

  @Query('SELECT * FROM FavoriteSong WHERE id = :id')
  Stream<FavoriteSong?> getSpecificFavorite(int id);

  @insert
  Future<void> insertFavorite(FavoriteSong song);

  @Query('DELETE FROM FavoriteSong where id = :id')
  Future<void> deleteFavorite(String id);
}
