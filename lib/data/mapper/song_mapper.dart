import 'package:flutter_spotify_bootleg/data/local/entity/favorite_song_entity.dart';
import 'package:flutter_spotify_bootleg/domain/models/song.dart';

extension SongToFavoriteSong on Song {
  FavoriteSong toFavoriteSong() {
    return FavoriteSong(
      id,
      title,
      artist,
    );
  }
}

extension FavoriteSongToSong on FavoriteSong {
  Song toSong(bool isFavorite) {
    return Song(
      id: id,
      title: name,
      artist: artist,
      isFavorite: isFavorite,
    );
  }
}
