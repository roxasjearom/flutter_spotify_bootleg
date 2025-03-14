import 'package:flutter_spotify_bootleg/infrastructure/local/entity/favorite_track_entity.dart';
import 'package:flutter_spotify_bootleg/infrastructure/mapper/artist_mapper.dart';
import 'package:flutter_spotify_bootleg/infrastructure/remote/response/album_response.dart';
import 'package:flutter_spotify_bootleg/domain/models/track.dart';
import 'package:flutter_spotify_bootleg/infrastructure/remote/response/artist_tracks_response.dart';

extension ItemDtoMapper on ItemDto {
  Track toTrack(bool isFavorite) {
    return Track(
      id: id,
      title: name,
      artist: artists.map((artist) => artist.toArtist().name).toList().join(', '),
      isFavorite: isFavorite,
    );
  }
}

extension TrackMapper on Track {
  FavoriteTrack toFavoriteTrack() {
    return FavoriteTrack(
      id,
      title,
      artist,
    );
  }
}

extension FavoriteTrackMapper on FavoriteTrack {
  Track toTrack(bool isFavorite) {
    return Track(
      id: id,
      title: name,
      artist: artist,
      isFavorite: isFavorite,
    );
  }
}

extension TrackDtoMapper on TrackDto {
  Track toTrack(bool isFavorite) {
    return Track(
      id: id,
      title: name,
      artist: artists.map((artist) => artist.toArtist().name).toList().join(', '),
      isFavorite: isFavorite,
    );
  }
}
