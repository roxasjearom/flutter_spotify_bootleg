import 'package:flutter_spotify_bootleg/infrastructure/mapper/artist_mapper.dart';
import 'package:flutter_spotify_bootleg/infrastructure/mapper/track_mapper.dart';
import 'package:flutter_spotify_bootleg/infrastructure/remote/response/album_response.dart';
import 'package:flutter_spotify_bootleg/domain/models/album.dart';
import 'package:flutter_spotify_bootleg/domain/models/album_details.dart';

extension AlbumDtoMapper on AlbumDto {
  Album toAlbum() {
    return Album(
      id: id,
      name: name,
      imageUrl: images.firstOrNull?.url ?? "",
    );
  }

  AlbumDetails toAlbumDetails() {
    return AlbumDetails(
      id: id,
      name: name,
      artist: artists.map((artist) => artist.toArtist().name).join(', '),
      imageUrl: images.firstOrNull?.url ?? "",
      tracks: tracks.items.map((track) => track.toTrack(false)).toList(),
    );
  }
}
