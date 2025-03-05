import 'package:flutter_spotify_bootleg/data/remote/response/album_response.dart';
import 'package:flutter_spotify_bootleg/domain/models/artist.dart';

extension ArtistMapper on ArtistDto {
  Artist toArtist() {
    return Artist(
      id: id,
      name: name,
      imageUrl: images?.firstOrNull?.url ?? "",
    );
  }
}
