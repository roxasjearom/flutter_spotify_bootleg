import 'package:flutter_spotify_bootleg/infrastructure/remote/response/artists_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'album_response.freezed.dart';
part 'album_response.g.dart';

@freezed
class AlbumResponse with _$AlbumResponse {
  factory AlbumResponse({
    required List<AlbumDto> albums,
  }) = _AlbumResponse;

  factory AlbumResponse.fromJson(Map<String, dynamic> json) =>
      _$AlbumResponseFromJson(json);
}

@freezed
class AlbumDto with _$AlbumDto {
  factory AlbumDto({
    @JsonKey(name: 'album_type') required String albumType,
    @JsonKey(name: 'total_tracks') required int totalTracks,
    required String href,
    required String id,
    required List<Image> images,
    required String name,
    @JsonKey(name: 'release_date') required String releaseDate,
    @JsonKey(name: 'release_date_precision')
        required String releaseDatePrecision,
    required String type,
    required String uri,
    required List<ArtistDto> artists,
    required Tracks tracks,
    required List<Copyright> copyrights,
    required String label,
    required int popularity,
  }) = _AlbumDto;

  factory AlbumDto.fromJson(Map<String, dynamic> json) =>
      _$AlbumDtoFromJson(json);
}

@freezed
class Tracks with _$Tracks {
  factory Tracks({
    required String href,
    required int limit,
    dynamic next,
    required int offset,
    dynamic previous,
    required int total,
    required List<Item> items,
  }) = _Tracks;

  factory Tracks.fromJson(Map<String, dynamic> json) => _$TracksFromJson(json);
}

@freezed
class Item with _$Item {
  factory Item({
    required List<ArtistDto> artists,
    @JsonKey(name: 'disc_number') required int discNumber,
    @JsonKey(name: 'duration_ms') required int durationMs,
    required bool explicit,
    required String href,
    required String id,
    required String name,
    @JsonKey(name: 'preview_url') String? previewUrl,
    @JsonKey(name: 'track_number') required int trackNumber,
    required String type,
    required String uri,
    @JsonKey(name: 'is_local') required bool isLocal,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

@freezed
class Copyright with _$Copyright {
  factory Copyright({
    required String text,
    required String type,
  }) = _Copyright;

  factory Copyright.fromJson(Map<String, dynamic> json) =>
      _$CopyrightFromJson(json);
}
