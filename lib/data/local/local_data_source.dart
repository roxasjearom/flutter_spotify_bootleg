import 'package:flutter_spotify_bootleg/data/local/dao/favorite_song_dao.dart';
import 'package:flutter_spotify_bootleg/data/local/entity/favorite_song_entity.dart';

class LocalDataSource {
  LocalDataSource({required FavoriteSongDao favoriteSongDao})
      : _favoriteSongDao = favoriteSongDao;

  final FavoriteSongDao _favoriteSongDao;

  Stream<List<FavoriteSong>> getAllFavorites() {
    return _favoriteSongDao.getAllFavorites();
  }

  Future<void> insertFavorite(FavoriteSong song) {
    return _favoriteSongDao.insertFavorite(song);
  }

  Future<void> deleteFavorite(String id) {
    return _favoriteSongDao.deleteFavorite(id);
  }
}
