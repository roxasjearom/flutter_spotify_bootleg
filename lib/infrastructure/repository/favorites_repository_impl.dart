import 'package:flutter_spotify_bootleg/domain/models/track.dart';
import 'package:flutter_spotify_bootleg/domain/repository/favorites_repository.dart';
import 'package:flutter_spotify_bootleg/infrastructure/local/dao/favorite_track_dao.dart';
import 'package:flutter_spotify_bootleg/infrastructure/local/entity/favorite_track_entity.dart';
import 'package:flutter_spotify_bootleg/infrastructure/mapper/track_mapper.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  FavoritesRepositoryImpl(this._favoriteTrackDao);

  final FavoriteTrackDao _favoriteTrackDao;

  @override
  Stream<List<Track>> getFavoritesStream() {
    final favoritesStream = _favoriteTrackDao.getAllFavoritesStream();

    return favoritesStream.map((favoritesList) => favoritesList
        .map((favoriteTrack) => favoriteTrack.toTrack(true))
        .toList());
  }

  @override
  Future<void> addToFavorites(Track track)  async {
    final favoriteFavorite =
          FavoriteTrack(track.id, track.title, track.artist);
      await _favoriteTrackDao.insertFavorite(favoriteFavorite);
  }

  @override
  Future<void> removeFromFavorites(Track track) async {
    _favoriteTrackDao.deleteFavorite(track.id);
  }

}
