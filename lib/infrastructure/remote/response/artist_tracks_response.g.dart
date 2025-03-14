// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_tracks_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArtistTracksResponseImpl _$$ArtistTracksResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ArtistTracksResponseImpl(
      tracks: (json['tracks'] as List<dynamic>)
          .map((e) => TrackDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ArtistTracksResponseImplToJson(
        _$ArtistTracksResponseImpl instance) =>
    <String, dynamic>{
      'tracks': instance.tracks,
    };

_$TrackImpl _$$TrackImplFromJson(Map<String, dynamic> json) => _$TrackImpl(
      artists: (json['artists'] as List<dynamic>)
          .map((e) => ArtistDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      discNumber: (json['disc_number'] as num).toInt(),
      durationMs: (json['duration_ms'] as num).toInt(),
      explicit: json['explicit'] as bool,
      href: json['href'] as String,
      id: json['id'] as String,
      isplayable: json['is_playable'] as bool,
      name: json['name'] as String,
      popularity: (json['popularity'] as num).toInt(),
      trackNumber: (json['track_number'] as num).toInt(),
      type: json['type'] as String,
      uri: json['uri'] as String,
      isLocal: json['is_local'] as bool,
    );

Map<String, dynamic> _$$TrackImplToJson(_$TrackImpl instance) =>
    <String, dynamic>{
      'artists': instance.artists,
      'disc_number': instance.discNumber,
      'duration_ms': instance.durationMs,
      'explicit': instance.explicit,
      'href': instance.href,
      'id': instance.id,
      'is_playable': instance.isplayable,
      'name': instance.name,
      'popularity': instance.popularity,
      'track_number': instance.trackNumber,
      'type': instance.type,
      'uri': instance.uri,
      'is_local': instance.isLocal,
    };
