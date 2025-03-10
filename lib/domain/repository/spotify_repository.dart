import 'package:flutter_spotify_bootleg/domain/models/models.dart';
import 'package:flutter_spotify_bootleg/domain/models/song.dart';

abstract interface class SpotifyRepository {
  Future<List<Category>> getCategories();
  Future<List<Album>> getAlbums();
  List<Artist> getArtists();
  Future<AlbumDetails> getAlbumDetails(String id);
  Stream<List<Song>> getSongList(String id);
  Future<List<Song>> getFavorites();
  List<Playlist> getPlaylists(String categoryId);
}
