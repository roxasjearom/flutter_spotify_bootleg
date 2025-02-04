import 'package:flutter_spotify_bootleg/domain/models/models.dart';

abstract interface class HomeRepository {
    List<Category> getCategories();
    List<Album> getAlbums();
}