// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artist_tracks_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ArtistTracksResponse _$ArtistTracksResponseFromJson(Map<String, dynamic> json) {
  return _ArtistTracksResponse.fromJson(json);
}

/// @nodoc
mixin _$ArtistTracksResponse {
  List<TrackDto> get tracks => throw _privateConstructorUsedError;

  /// Serializes this ArtistTracksResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ArtistTracksResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArtistTracksResponseCopyWith<ArtistTracksResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtistTracksResponseCopyWith<$Res> {
  factory $ArtistTracksResponseCopyWith(ArtistTracksResponse value,
          $Res Function(ArtistTracksResponse) then) =
      _$ArtistTracksResponseCopyWithImpl<$Res, ArtistTracksResponse>;
  @useResult
  $Res call({List<TrackDto> tracks});
}

/// @nodoc
class _$ArtistTracksResponseCopyWithImpl<$Res,
        $Val extends ArtistTracksResponse>
    implements $ArtistTracksResponseCopyWith<$Res> {
  _$ArtistTracksResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ArtistTracksResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tracks = null,
  }) {
    return _then(_value.copyWith(
      tracks: null == tracks
          ? _value.tracks
          : tracks // ignore: cast_nullable_to_non_nullable
              as List<TrackDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArtistTracksResponseImplCopyWith<$Res>
    implements $ArtistTracksResponseCopyWith<$Res> {
  factory _$$ArtistTracksResponseImplCopyWith(_$ArtistTracksResponseImpl value,
          $Res Function(_$ArtistTracksResponseImpl) then) =
      __$$ArtistTracksResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TrackDto> tracks});
}

/// @nodoc
class __$$ArtistTracksResponseImplCopyWithImpl<$Res>
    extends _$ArtistTracksResponseCopyWithImpl<$Res, _$ArtistTracksResponseImpl>
    implements _$$ArtistTracksResponseImplCopyWith<$Res> {
  __$$ArtistTracksResponseImplCopyWithImpl(_$ArtistTracksResponseImpl _value,
      $Res Function(_$ArtistTracksResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ArtistTracksResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tracks = null,
  }) {
    return _then(_$ArtistTracksResponseImpl(
      tracks: null == tracks
          ? _value._tracks
          : tracks // ignore: cast_nullable_to_non_nullable
              as List<TrackDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtistTracksResponseImpl implements _ArtistTracksResponse {
  const _$ArtistTracksResponseImpl({required final List<TrackDto> tracks})
      : _tracks = tracks;

  factory _$ArtistTracksResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtistTracksResponseImplFromJson(json);

  final List<TrackDto> _tracks;
  @override
  List<TrackDto> get tracks {
    if (_tracks is EqualUnmodifiableListView) return _tracks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tracks);
  }

  @override
  String toString() {
    return 'ArtistTracksResponse(tracks: $tracks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtistTracksResponseImpl &&
            const DeepCollectionEquality().equals(other._tracks, _tracks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tracks));

  /// Create a copy of ArtistTracksResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtistTracksResponseImplCopyWith<_$ArtistTracksResponseImpl>
      get copyWith =>
          __$$ArtistTracksResponseImplCopyWithImpl<_$ArtistTracksResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtistTracksResponseImplToJson(
      this,
    );
  }
}

abstract class _ArtistTracksResponse implements ArtistTracksResponse {
  const factory _ArtistTracksResponse({required final List<TrackDto> tracks}) =
      _$ArtistTracksResponseImpl;

  factory _ArtistTracksResponse.fromJson(Map<String, dynamic> json) =
      _$ArtistTracksResponseImpl.fromJson;

  @override
  List<TrackDto> get tracks;

  /// Create a copy of ArtistTracksResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArtistTracksResponseImplCopyWith<_$ArtistTracksResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TrackDto _$TrackDtoFromJson(Map<String, dynamic> json) {
  return _Track.fromJson(json);
}

/// @nodoc
mixin _$TrackDto {
  List<ArtistDto> get artists => throw _privateConstructorUsedError;
  @JsonKey(name: 'disc_number')
  int get discNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration_ms')
  int get durationMs => throw _privateConstructorUsedError;
  bool get explicit => throw _privateConstructorUsedError;
  String get href => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_playable')
  bool get isplayable => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get popularity => throw _privateConstructorUsedError;
  @JsonKey(name: 'track_number')
  int get trackNumber => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get uri => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_local')
  bool get isLocal => throw _privateConstructorUsedError;

  /// Serializes this TrackDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TrackDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrackDtoCopyWith<TrackDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackDtoCopyWith<$Res> {
  factory $TrackDtoCopyWith(TrackDto value, $Res Function(TrackDto) then) =
      _$TrackDtoCopyWithImpl<$Res, TrackDto>;
  @useResult
  $Res call(
      {List<ArtistDto> artists,
      @JsonKey(name: 'disc_number') int discNumber,
      @JsonKey(name: 'duration_ms') int durationMs,
      bool explicit,
      String href,
      String id,
      @JsonKey(name: 'is_playable') bool isplayable,
      String name,
      int popularity,
      @JsonKey(name: 'track_number') int trackNumber,
      String type,
      String uri,
      @JsonKey(name: 'is_local') bool isLocal});
}

/// @nodoc
class _$TrackDtoCopyWithImpl<$Res, $Val extends TrackDto>
    implements $TrackDtoCopyWith<$Res> {
  _$TrackDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrackDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artists = null,
    Object? discNumber = null,
    Object? durationMs = null,
    Object? explicit = null,
    Object? href = null,
    Object? id = null,
    Object? isplayable = null,
    Object? name = null,
    Object? popularity = null,
    Object? trackNumber = null,
    Object? type = null,
    Object? uri = null,
    Object? isLocal = null,
  }) {
    return _then(_value.copyWith(
      artists: null == artists
          ? _value.artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<ArtistDto>,
      discNumber: null == discNumber
          ? _value.discNumber
          : discNumber // ignore: cast_nullable_to_non_nullable
              as int,
      durationMs: null == durationMs
          ? _value.durationMs
          : durationMs // ignore: cast_nullable_to_non_nullable
              as int,
      explicit: null == explicit
          ? _value.explicit
          : explicit // ignore: cast_nullable_to_non_nullable
              as bool,
      href: null == href
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isplayable: null == isplayable
          ? _value.isplayable
          : isplayable // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as int,
      trackNumber: null == trackNumber
          ? _value.trackNumber
          : trackNumber // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      uri: null == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
      isLocal: null == isLocal
          ? _value.isLocal
          : isLocal // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrackImplCopyWith<$Res> implements $TrackDtoCopyWith<$Res> {
  factory _$$TrackImplCopyWith(
          _$TrackImpl value, $Res Function(_$TrackImpl) then) =
      __$$TrackImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ArtistDto> artists,
      @JsonKey(name: 'disc_number') int discNumber,
      @JsonKey(name: 'duration_ms') int durationMs,
      bool explicit,
      String href,
      String id,
      @JsonKey(name: 'is_playable') bool isplayable,
      String name,
      int popularity,
      @JsonKey(name: 'track_number') int trackNumber,
      String type,
      String uri,
      @JsonKey(name: 'is_local') bool isLocal});
}

/// @nodoc
class __$$TrackImplCopyWithImpl<$Res>
    extends _$TrackDtoCopyWithImpl<$Res, _$TrackImpl>
    implements _$$TrackImplCopyWith<$Res> {
  __$$TrackImplCopyWithImpl(
      _$TrackImpl _value, $Res Function(_$TrackImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrackDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artists = null,
    Object? discNumber = null,
    Object? durationMs = null,
    Object? explicit = null,
    Object? href = null,
    Object? id = null,
    Object? isplayable = null,
    Object? name = null,
    Object? popularity = null,
    Object? trackNumber = null,
    Object? type = null,
    Object? uri = null,
    Object? isLocal = null,
  }) {
    return _then(_$TrackImpl(
      artists: null == artists
          ? _value._artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<ArtistDto>,
      discNumber: null == discNumber
          ? _value.discNumber
          : discNumber // ignore: cast_nullable_to_non_nullable
              as int,
      durationMs: null == durationMs
          ? _value.durationMs
          : durationMs // ignore: cast_nullable_to_non_nullable
              as int,
      explicit: null == explicit
          ? _value.explicit
          : explicit // ignore: cast_nullable_to_non_nullable
              as bool,
      href: null == href
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isplayable: null == isplayable
          ? _value.isplayable
          : isplayable // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as int,
      trackNumber: null == trackNumber
          ? _value.trackNumber
          : trackNumber // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      uri: null == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
      isLocal: null == isLocal
          ? _value.isLocal
          : isLocal // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrackImpl implements _Track {
  const _$TrackImpl(
      {required final List<ArtistDto> artists,
      @JsonKey(name: 'disc_number') required this.discNumber,
      @JsonKey(name: 'duration_ms') required this.durationMs,
      required this.explicit,
      required this.href,
      required this.id,
      @JsonKey(name: 'is_playable') required this.isplayable,
      required this.name,
      required this.popularity,
      @JsonKey(name: 'track_number') required this.trackNumber,
      required this.type,
      required this.uri,
      @JsonKey(name: 'is_local') required this.isLocal})
      : _artists = artists;

  factory _$TrackImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrackImplFromJson(json);

  final List<ArtistDto> _artists;
  @override
  List<ArtistDto> get artists {
    if (_artists is EqualUnmodifiableListView) return _artists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_artists);
  }

  @override
  @JsonKey(name: 'disc_number')
  final int discNumber;
  @override
  @JsonKey(name: 'duration_ms')
  final int durationMs;
  @override
  final bool explicit;
  @override
  final String href;
  @override
  final String id;
  @override
  @JsonKey(name: 'is_playable')
  final bool isplayable;
  @override
  final String name;
  @override
  final int popularity;
  @override
  @JsonKey(name: 'track_number')
  final int trackNumber;
  @override
  final String type;
  @override
  final String uri;
  @override
  @JsonKey(name: 'is_local')
  final bool isLocal;

  @override
  String toString() {
    return 'TrackDto(artists: $artists, discNumber: $discNumber, durationMs: $durationMs, explicit: $explicit, href: $href, id: $id, isplayable: $isplayable, name: $name, popularity: $popularity, trackNumber: $trackNumber, type: $type, uri: $uri, isLocal: $isLocal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackImpl &&
            const DeepCollectionEquality().equals(other._artists, _artists) &&
            (identical(other.discNumber, discNumber) ||
                other.discNumber == discNumber) &&
            (identical(other.durationMs, durationMs) ||
                other.durationMs == durationMs) &&
            (identical(other.explicit, explicit) ||
                other.explicit == explicit) &&
            (identical(other.href, href) || other.href == href) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isplayable, isplayable) ||
                other.isplayable == isplayable) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity) &&
            (identical(other.trackNumber, trackNumber) ||
                other.trackNumber == trackNumber) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.uri, uri) || other.uri == uri) &&
            (identical(other.isLocal, isLocal) || other.isLocal == isLocal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_artists),
      discNumber,
      durationMs,
      explicit,
      href,
      id,
      isplayable,
      name,
      popularity,
      trackNumber,
      type,
      uri,
      isLocal);

  /// Create a copy of TrackDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrackImplCopyWith<_$TrackImpl> get copyWith =>
      __$$TrackImplCopyWithImpl<_$TrackImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrackImplToJson(
      this,
    );
  }
}

abstract class _Track implements TrackDto {
  const factory _Track(
      {required final List<ArtistDto> artists,
      @JsonKey(name: 'disc_number') required final int discNumber,
      @JsonKey(name: 'duration_ms') required final int durationMs,
      required final bool explicit,
      required final String href,
      required final String id,
      @JsonKey(name: 'is_playable') required final bool isplayable,
      required final String name,
      required final int popularity,
      @JsonKey(name: 'track_number') required final int trackNumber,
      required final String type,
      required final String uri,
      @JsonKey(name: 'is_local') required final bool isLocal}) = _$TrackImpl;

  factory _Track.fromJson(Map<String, dynamic> json) = _$TrackImpl.fromJson;

  @override
  List<ArtistDto> get artists;
  @override
  @JsonKey(name: 'disc_number')
  int get discNumber;
  @override
  @JsonKey(name: 'duration_ms')
  int get durationMs;
  @override
  bool get explicit;
  @override
  String get href;
  @override
  String get id;
  @override
  @JsonKey(name: 'is_playable')
  bool get isplayable;
  @override
  String get name;
  @override
  int get popularity;
  @override
  @JsonKey(name: 'track_number')
  int get trackNumber;
  @override
  String get type;
  @override
  String get uri;
  @override
  @JsonKey(name: 'is_local')
  bool get isLocal;

  /// Create a copy of TrackDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrackImplCopyWith<_$TrackImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
