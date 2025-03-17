import 'package:flutter_spotify_bootleg/domain/models/api_failure.dart';
import 'package:flutter_spotify_bootleg/domain/models/models.dart';
import 'package:dartz/dartz.dart';

abstract interface class SpotifyRepository {
  Future<Either<ApiFailure, List<Category>>> getSeveralCategories(int limit);
  Future<Either<ApiFailure, List<Album>>> getSeveralAlbums(String ids);
  Future<Either<ApiFailure,List<Artist>>> getSeveralArtists(String ids);
  Future<Either<ApiFailure,AlbumDetails>> getAlbumDetails(String id);
  Future<Either<ApiFailure, AlbumDetails>> getArtistTopTracks(String id);
  List<Playlist> getPlaylists(String categoryId);
}
