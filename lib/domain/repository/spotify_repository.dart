import 'package:flutter_spotify_bootleg/domain/models/api_failure.dart';
import 'package:flutter_spotify_bootleg/domain/models/models.dart';
import 'package:flutter_spotify_bootleg/domain/models/song.dart';
import 'package:dartz/dartz.dart';

abstract interface class SpotifyRepository {
  Future<Either<ApiFailure, List<Category>>> getCategories();
  Future<Either<ApiFailure, List<Album>>> getAlbums();
  Future<Either<ApiFailure,List<Artist>>> getArtists();
  Future<Either<ApiFailure,AlbumDetails>> getAlbumDetails(String id);
  Stream<List<Song>> getFavoritesStream();
  Future<List<Song>> getFavorites();
  List<Playlist> getPlaylists(String categoryId);
}
