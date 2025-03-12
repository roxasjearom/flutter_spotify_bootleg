// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlbumResponseImpl _$$AlbumResponseImplFromJson(Map<String, dynamic> json) =>
    _$AlbumResponseImpl(
      albums: (json['albums'] as List<dynamic>)
          .map((e) => AlbumDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AlbumResponseImplToJson(_$AlbumResponseImpl instance) =>
    <String, dynamic>{
      'albums': instance.albums,
    };

_$AlbumDtoImpl _$$AlbumDtoImplFromJson(Map<String, dynamic> json) =>
    _$AlbumDtoImpl(
      albumType: json['album_type'] as String,
      totalTracks: (json['total_tracks'] as num).toInt(),
      href: json['href'] as String,
      id: json['id'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
      releaseDate: json['release_date'] as String,
      releaseDatePrecision: json['release_date_precision'] as String,
      type: json['type'] as String,
      uri: json['uri'] as String,
      artists: (json['artists'] as List<dynamic>)
          .map((e) => ArtistDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      tracks: Tracks.fromJson(json['tracks'] as Map<String, dynamic>),
      copyrights: (json['copyrights'] as List<dynamic>)
          .map((e) => Copyright.fromJson(e as Map<String, dynamic>))
          .toList(),
      label: json['label'] as String,
      popularity: (json['popularity'] as num).toInt(),
    );

Map<String, dynamic> _$$AlbumDtoImplToJson(_$AlbumDtoImpl instance) =>
    <String, dynamic>{
      'album_type': instance.albumType,
      'total_tracks': instance.totalTracks,
      'href': instance.href,
      'id': instance.id,
      'images': instance.images,
      'name': instance.name,
      'release_date': instance.releaseDate,
      'release_date_precision': instance.releaseDatePrecision,
      'type': instance.type,
      'uri': instance.uri,
      'artists': instance.artists,
      'tracks': instance.tracks,
      'copyrights': instance.copyrights,
      'label': instance.label,
      'popularity': instance.popularity,
    };

_$TracksImpl _$$TracksImplFromJson(Map<String, dynamic> json) => _$TracksImpl(
      href: json['href'] as String,
      limit: (json['limit'] as num).toInt(),
      next: json['next'],
      offset: (json['offset'] as num).toInt(),
      previous: json['previous'],
      total: (json['total'] as num).toInt(),
      items: (json['items'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TracksImplToJson(_$TracksImpl instance) =>
    <String, dynamic>{
      'href': instance.href,
      'limit': instance.limit,
      'next': instance.next,
      'offset': instance.offset,
      'previous': instance.previous,
      'total': instance.total,
      'items': instance.items,
    };

_$ItemImpl _$$ItemImplFromJson(Map<String, dynamic> json) => _$ItemImpl(
      artists: (json['artists'] as List<dynamic>)
          .map((e) => ArtistDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      discNumber: (json['disc_number'] as num).toInt(),
      durationMs: (json['duration_ms'] as num).toInt(),
      explicit: json['explicit'] as bool,
      href: json['href'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      previewUrl: json['preview_url'] as String?,
      trackNumber: (json['track_number'] as num).toInt(),
      type: json['type'] as String,
      uri: json['uri'] as String,
      isLocal: json['is_local'] as bool,
    );

Map<String, dynamic> _$$ItemImplToJson(_$ItemImpl instance) =>
    <String, dynamic>{
      'artists': instance.artists,
      'disc_number': instance.discNumber,
      'duration_ms': instance.durationMs,
      'explicit': instance.explicit,
      'href': instance.href,
      'id': instance.id,
      'name': instance.name,
      'preview_url': instance.previewUrl,
      'track_number': instance.trackNumber,
      'type': instance.type,
      'uri': instance.uri,
      'is_local': instance.isLocal,
    };

_$CopyrightImpl _$$CopyrightImplFromJson(Map<String, dynamic> json) =>
    _$CopyrightImpl(
      text: json['text'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$CopyrightImplToJson(_$CopyrightImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'type': instance.type,
    };
