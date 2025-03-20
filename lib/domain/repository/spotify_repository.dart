import 'package:flutter_spotify_bootleg/domain/models/api_failure.dart';
import 'package:flutter_spotify_bootleg/domain/models/models.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_spotify_bootleg/domain/models/track.dart';

abstract interface class SpotifyRepository {
  Future<Either<ApiFailure, List<Category>>> getSeveralCategories(int limit);
  Future<Either<ApiFailure, List<Album>>> getSeveralAlbums(String ids);
  Future<Either<ApiFailure, List<Artist>>> getSeveralArtists(String ids);
  Future<Either<ApiFailure, HeaderDetails>> getAlbumDetails(String id);
  Future<Either<ApiFailure, HeaderDetails>> getArtistTopTracks(String id);
  Stream<List<Track>> getAlbumTracksStream(String id);
  Stream<List<Track>> getArtistTopTracksStream(String id);
  List<Playlist> getPlaylists(String categoryId);
}
