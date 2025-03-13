import 'package:flutter_spotify_bootleg/infrastructure/remote/response/artists_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'artist_tracks_response.freezed.dart';
part 'artist_tracks_response.g.dart';

@freezed
class ArtistTracksResponse with _$ArtistTracksResponse {
  const factory ArtistTracksResponse({
    required List<Track> tracks,
  }) = _TrackResponse;

  factory ArtistTracksResponse.fromJson(Map<String, Object?> json) =>
      _$ArtistTracksResponseFromJson(json);
}

@freezed
class Track with _$Track {
  const factory Track({
    required List<ArtistDto> artists,
    @JsonKey(name: 'disc_number') required int discNumber,
    @JsonKey(name: 'duration_ms') required int durationMs,
    required bool explicit,
    required String href,
    required String id,
    @JsonKey(name: 'is_playable') required bool isplayable,
    required String name,
    required int popularity,
    @JsonKey(name: 'track_number') required int trackNumber,
    required String type,
    required String uri,
    @JsonKey(name: 'is_local') required bool isLocal,
  }) = _Track;

  factory Track.fromJson(Map<String, Object?> json) => _$TrackFromJson(json);
}
