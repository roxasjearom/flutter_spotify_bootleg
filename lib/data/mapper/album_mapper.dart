import 'package:flutter_spotify_bootleg/data/remote/response/album_response.dart';
import 'package:flutter_spotify_bootleg/domain/models/album.dart';

extension AlbumDtoToAlbum on AlbumDto {
  Album toAlbum() {
    return Album(
      id: id,
      name: name,
      imageUrl: images.firstOrNull?.url ?? "",
    );
  }
}
