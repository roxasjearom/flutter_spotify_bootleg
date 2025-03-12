import 'package:freezed_annotation/freezed_annotation.dart';

part 'artists_response.freezed.dart';
part 'artists_response.g.dart';

@freezed
class ArtistsResponse with _$ArtistsResponse {
  factory ArtistsResponse({
    required List<ArtistDto> artists,
  }) = _ArtistsResponse;

  factory ArtistsResponse.fromJson(Map<String, Object?> json) =>
      _$ArtistsResponseFromJson(json);
}

@freezed
class ArtistDto with _$ArtistDto {
  factory ArtistDto({
    required String href,
    required String id,
    required String name,
    required String type,
    required String uri,
    Followers? followers,
    List<String>? genres,
    List<Image>? images,
    int? popularity,
  }) = _ArtistDto;

  factory ArtistDto.fromJson(Map<String, Object?> json) =>
      _$ArtistDtoFromJson(json);
}

@freezed
class Followers with _$Followers {
  factory Followers({
    required int total,
  }) = _Followers;

  factory Followers.fromJson(Map<String, Object?> json) =>
      _$FollowersFromJson(json);
}

@freezed
class Image with _$Image {
  factory Image({
    required String url,
    required int height,
    required int width,
  }) = _Image;

  factory Image.fromJson(Map<String, Object?> json) => _$ImageFromJson(json);
}
