import 'package:flutter_spotify_bootleg/infrastructure/local/entity/favorite_song_entity.dart';
import 'package:flutter_spotify_bootleg/infrastructure/mapper/artist_mapper.dart';
import 'package:flutter_spotify_bootleg/infrastructure/remote/response/album_response.dart';
import 'package:flutter_spotify_bootleg/domain/models/song.dart';
import 'package:flutter_spotify_bootleg/infrastructure/remote/response/artist_tracks_response.dart';

extension SongMapper on Item {
  Song toSong(bool isFavorite) {
    return Song(
      id: id,
      title: name,
      artist: artists.map((artist) => artist.toArtist().name).toList().join(', '),
      isFavorite: isFavorite,
    );
  }
}

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

extension TrackMapper on Track {
  Song toSong(bool isFavorite) {
    return Song(
      id: id,
      title: name,
      artist: artists.map((artist) => artist.toArtist().name).toList().join(', '),
      isFavorite: isFavorite,
    );
  }
}
