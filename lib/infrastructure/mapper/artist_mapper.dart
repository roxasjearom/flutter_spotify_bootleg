import 'package:flutter_spotify_bootleg/domain/models/artist.dart';
import 'package:flutter_spotify_bootleg/infrastructure/remote/response/artists_response.dart';

extension ArtistDtoMapper on ArtistDto {
  Artist toArtist() {
    return Artist(
      id: id,
      name: name,
      imageUrl: images?.firstOrNull?.url ?? "",
    );
  }
}
