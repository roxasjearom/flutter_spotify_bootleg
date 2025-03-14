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
    FollowersDto? followers,
    List<String>? genres,
    List<ImageDto>? images,
    int? popularity,
  }) = _ArtistDto;

  factory ArtistDto.fromJson(Map<String, Object?> json) =>
      _$ArtistDtoFromJson(json);
}

@freezed
class FollowersDto with _$FollowersDto {
  factory FollowersDto({
    required int total,
  }) = _Followers;

  factory FollowersDto.fromJson(Map<String, Object?> json) =>
      _$FollowersDtoFromJson(json);
}

@freezed
class ImageDto with _$ImageDto {
  factory ImageDto({
    required String url,
    required int height,
    required int width,
  }) = _Image;

  factory ImageDto.fromJson(Map<String, Object?> json) => _$ImageDtoFromJson(json);
}
