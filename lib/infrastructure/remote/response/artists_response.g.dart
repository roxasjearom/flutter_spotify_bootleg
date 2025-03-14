// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artists_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArtistsResponseImpl _$$ArtistsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ArtistsResponseImpl(
      artists: (json['artists'] as List<dynamic>)
          .map((e) => ArtistDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ArtistsResponseImplToJson(
        _$ArtistsResponseImpl instance) =>
    <String, dynamic>{
      'artists': instance.artists,
    };

_$ArtistDtoImpl _$$ArtistDtoImplFromJson(Map<String, dynamic> json) =>
    _$ArtistDtoImpl(
      href: json['href'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      uri: json['uri'] as String,
      followers: json['followers'] == null
          ? null
          : FollowersDto.fromJson(json['followers'] as Map<String, dynamic>),
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ImageDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      popularity: (json['popularity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ArtistDtoImplToJson(_$ArtistDtoImpl instance) =>
    <String, dynamic>{
      'href': instance.href,
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'uri': instance.uri,
      'followers': instance.followers,
      'genres': instance.genres,
      'images': instance.images,
      'popularity': instance.popularity,
    };

_$FollowersImpl _$$FollowersImplFromJson(Map<String, dynamic> json) =>
    _$FollowersImpl(
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$$FollowersImplToJson(_$FollowersImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
    };

_$ImageImpl _$$ImageImplFromJson(Map<String, dynamic> json) => _$ImageImpl(
      url: json['url'] as String,
      height: (json['height'] as num).toInt(),
      width: (json['width'] as num).toInt(),
    );

Map<String, dynamic> _$$ImageImplToJson(_$ImageImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'height': instance.height,
      'width': instance.width,
    };
