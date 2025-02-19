import 'package:flutter_spotify_bootleg/domain/models/models.dart';
import 'package:flutter_spotify_bootleg/domain/models/song.dart';

abstract interface class HomeRepository {
  List<Category> getCategories();
  List<Album> getAlbums();
  List<Artist> getArtists();
  AlbumDetails getAlbumDetails(String id);
  Stream<List<Song>> getSongList(String id);
}
