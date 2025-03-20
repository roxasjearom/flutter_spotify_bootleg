import 'package:flutter_spotify_bootleg/infrastructure/mapper/artist_mapper.dart';
import 'package:flutter_spotify_bootleg/infrastructure/mapper/track_mapper.dart';
import 'package:flutter_spotify_bootleg/infrastructure/remote/response/album_response.dart';
import 'package:flutter_spotify_bootleg/domain/models/album.dart';
import 'package:flutter_spotify_bootleg/domain/models/header_details.dart';
import 'package:flutter_spotify_bootleg/utils/utils.dart';

extension AlbumDtoMapper on AlbumDto {
  Album toAlbum() {
    return Album(
      id: id,
      name: name,
      imageUrl: images.firstOrNull?.url ?? "",
    );
  }

  HeaderDetails toHeaderDetails() {
    return HeaderDetails(
      id: id,
      name: name,
      artist: artists.map((artist) => artist.toArtist().name).join(', '),
      imageUrl: images.firstOrNull?.url ?? "",
      subHeaderValue: getYearFromDateString(releaseDate),
      tracks: tracks.items.map((track) => track.toTrack(false)).toList(),
    );
  }
}

