import 'package:flutter_spotify_bootleg/infrastructure/local/dao/favorite_track_dao.dart';
import 'package:flutter_spotify_bootleg/infrastructure/local/entity/favorite_track_entity.dart';

class LocalDataSource {
  LocalDataSource({required FavoriteTrackDao favoriteTrackDao})
      : _favoriteTrackDao = favoriteTrackDao;

  final FavoriteTrackDao _favoriteTrackDao;

  Future<List<FavoriteTrack>> getAllFavorites() {
    return _favoriteTrackDao.getFavorites();
  }

  Future<void> insertFavorite(FavoriteTrack track) {
    return _favoriteTrackDao.insertFavorite(track);
  }

  Future<void> deleteFavorite(String id) {
    return _favoriteTrackDao.deleteFavorite(id);
  }
}
