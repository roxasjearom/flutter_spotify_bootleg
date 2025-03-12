// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'album_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AlbumResponse _$AlbumResponseFromJson(Map<String, dynamic> json) {
  return _AlbumResponse.fromJson(json);
}

/// @nodoc
mixin _$AlbumResponse {
  List<AlbumDto> get albums => throw _privateConstructorUsedError;

  /// Serializes this AlbumResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AlbumResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AlbumResponseCopyWith<AlbumResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumResponseCopyWith<$Res> {
  factory $AlbumResponseCopyWith(
          AlbumResponse value, $Res Function(AlbumResponse) then) =
      _$AlbumResponseCopyWithImpl<$Res, AlbumResponse>;
  @useResult
  $Res call({List<AlbumDto> albums});
}

/// @nodoc
class _$AlbumResponseCopyWithImpl<$Res, $Val extends AlbumResponse>
    implements $AlbumResponseCopyWith<$Res> {
  _$AlbumResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AlbumResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? albums = null,
  }) {
    return _then(_value.copyWith(
      albums: null == albums
          ? _value.albums
          : albums // ignore: cast_nullable_to_non_nullable
              as List<AlbumDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlbumResponseImplCopyWith<$Res>
    implements $AlbumResponseCopyWith<$Res> {
  factory _$$AlbumResponseImplCopyWith(
          _$AlbumResponseImpl value, $Res Function(_$AlbumResponseImpl) then) =
      __$$AlbumResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AlbumDto> albums});
}

/// @nodoc
class __$$AlbumResponseImplCopyWithImpl<$Res>
    extends _$AlbumResponseCopyWithImpl<$Res, _$AlbumResponseImpl>
    implements _$$AlbumResponseImplCopyWith<$Res> {
  __$$AlbumResponseImplCopyWithImpl(
      _$AlbumResponseImpl _value, $Res Function(_$AlbumResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of AlbumResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? albums = null,
  }) {
    return _then(_$AlbumResponseImpl(
      albums: null == albums
          ? _value._albums
          : albums // ignore: cast_nullable_to_non_nullable
              as List<AlbumDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlbumResponseImpl implements _AlbumResponse {
  _$AlbumResponseImpl({required final List<AlbumDto> albums})
      : _albums = albums;

  factory _$AlbumResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlbumResponseImplFromJson(json);

  final List<AlbumDto> _albums;
  @override
  List<AlbumDto> get albums {
    if (_albums is EqualUnmodifiableListView) return _albums;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_albums);
  }

  @override
  String toString() {
    return 'AlbumResponse(albums: $albums)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlbumResponseImpl &&
            const DeepCollectionEquality().equals(other._albums, _albums));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_albums));

  /// Create a copy of AlbumResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlbumResponseImplCopyWith<_$AlbumResponseImpl> get copyWith =>
      __$$AlbumResponseImplCopyWithImpl<_$AlbumResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlbumResponseImplToJson(
      this,
    );
  }
}

abstract class _AlbumResponse implements AlbumResponse {
  factory _AlbumResponse({required final List<AlbumDto> albums}) =
      _$AlbumResponseImpl;

  factory _AlbumResponse.fromJson(Map<String, dynamic> json) =
      _$AlbumResponseImpl.fromJson;

  @override
  List<AlbumDto> get albums;

  /// Create a copy of AlbumResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlbumResponseImplCopyWith<_$AlbumResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AlbumDto _$AlbumDtoFromJson(Map<String, dynamic> json) {
  return _AlbumDto.fromJson(json);
}

/// @nodoc
mixin _$AlbumDto {
  @JsonKey(name: 'album_type')
  String get albumType => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_tracks')
  int get totalTracks => throw _privateConstructorUsedError;
  String get href => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  List<Image> get images => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'release_date')
  String get releaseDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'release_date_precision')
  String get releaseDatePrecision => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get uri => throw _privateConstructorUsedError;
  List<ArtistDto> get artists => throw _privateConstructorUsedError;
  Tracks get tracks => throw _privateConstructorUsedError;
  List<Copyright> get copyrights => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  int get popularity => throw _privateConstructorUsedError;

  /// Serializes this AlbumDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AlbumDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AlbumDtoCopyWith<AlbumDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumDtoCopyWith<$Res> {
  factory $AlbumDtoCopyWith(AlbumDto value, $Res Function(AlbumDto) then) =
      _$AlbumDtoCopyWithImpl<$Res, AlbumDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'album_type') String albumType,
      @JsonKey(name: 'total_tracks') int totalTracks,
      String href,
      String id,
      List<Image> images,
      String name,
      @JsonKey(name: 'release_date') String releaseDate,
      @JsonKey(name: 'release_date_precision') String releaseDatePrecision,
      String type,
      String uri,
      List<ArtistDto> artists,
      Tracks tracks,
      List<Copyright> copyrights,
      String label,
      int popularity});

  $TracksCopyWith<$Res> get tracks;
}

/// @nodoc
class _$AlbumDtoCopyWithImpl<$Res, $Val extends AlbumDto>
    implements $AlbumDtoCopyWith<$Res> {
  _$AlbumDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AlbumDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? albumType = null,
    Object? totalTracks = null,
    Object? href = null,
    Object? id = null,
    Object? images = null,
    Object? name = null,
    Object? releaseDate = null,
    Object? releaseDatePrecision = null,
    Object? type = null,
    Object? uri = null,
    Object? artists = null,
    Object? tracks = null,
    Object? copyrights = null,
    Object? label = null,
    Object? popularity = null,
  }) {
    return _then(_value.copyWith(
      albumType: null == albumType
          ? _value.albumType
          : albumType // ignore: cast_nullable_to_non_nullable
              as String,
      totalTracks: null == totalTracks
          ? _value.totalTracks
          : totalTracks // ignore: cast_nullable_to_non_nullable
              as int,
      href: null == href
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Image>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDatePrecision: null == releaseDatePrecision
          ? _value.releaseDatePrecision
          : releaseDatePrecision // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      uri: null == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
      artists: null == artists
          ? _value.artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<ArtistDto>,
      tracks: null == tracks
          ? _value.tracks
          : tracks // ignore: cast_nullable_to_non_nullable
              as Tracks,
      copyrights: null == copyrights
          ? _value.copyrights
          : copyrights // ignore: cast_nullable_to_non_nullable
              as List<Copyright>,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of AlbumDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TracksCopyWith<$Res> get tracks {
    return $TracksCopyWith<$Res>(_value.tracks, (value) {
      return _then(_value.copyWith(tracks: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AlbumDtoImplCopyWith<$Res>
    implements $AlbumDtoCopyWith<$Res> {
  factory _$$AlbumDtoImplCopyWith(
          _$AlbumDtoImpl value, $Res Function(_$AlbumDtoImpl) then) =
      __$$AlbumDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'album_type') String albumType,
      @JsonKey(name: 'total_tracks') int totalTracks,
      String href,
      String id,
      List<Image> images,
      String name,
      @JsonKey(name: 'release_date') String releaseDate,
      @JsonKey(name: 'release_date_precision') String releaseDatePrecision,
      String type,
      String uri,
      List<ArtistDto> artists,
      Tracks tracks,
      List<Copyright> copyrights,
      String label,
      int popularity});

  @override
  $TracksCopyWith<$Res> get tracks;
}

/// @nodoc
class __$$AlbumDtoImplCopyWithImpl<$Res>
    extends _$AlbumDtoCopyWithImpl<$Res, _$AlbumDtoImpl>
    implements _$$AlbumDtoImplCopyWith<$Res> {
  __$$AlbumDtoImplCopyWithImpl(
      _$AlbumDtoImpl _value, $Res Function(_$AlbumDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of AlbumDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? albumType = null,
    Object? totalTracks = null,
    Object? href = null,
    Object? id = null,
    Object? images = null,
    Object? name = null,
    Object? releaseDate = null,
    Object? releaseDatePrecision = null,
    Object? type = null,
    Object? uri = null,
    Object? artists = null,
    Object? tracks = null,
    Object? copyrights = null,
    Object? label = null,
    Object? popularity = null,
  }) {
    return _then(_$AlbumDtoImpl(
      albumType: null == albumType
          ? _value.albumType
          : albumType // ignore: cast_nullable_to_non_nullable
              as String,
      totalTracks: null == totalTracks
          ? _value.totalTracks
          : totalTracks // ignore: cast_nullable_to_non_nullable
              as int,
      href: null == href
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Image>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDatePrecision: null == releaseDatePrecision
          ? _value.releaseDatePrecision
          : releaseDatePrecision // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      uri: null == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
      artists: null == artists
          ? _value._artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<ArtistDto>,
      tracks: null == tracks
          ? _value.tracks
          : tracks // ignore: cast_nullable_to_non_nullable
              as Tracks,
      copyrights: null == copyrights
          ? _value._copyrights
          : copyrights // ignore: cast_nullable_to_non_nullable
              as List<Copyright>,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlbumDtoImpl implements _AlbumDto {
  _$AlbumDtoImpl(
      {@JsonKey(name: 'album_type') required this.albumType,
      @JsonKey(name: 'total_tracks') required this.totalTracks,
      required this.href,
      required this.id,
      required final List<Image> images,
      required this.name,
      @JsonKey(name: 'release_date') required this.releaseDate,
      @JsonKey(name: 'release_date_precision')
      required this.releaseDatePrecision,
      required this.type,
      required this.uri,
      required final List<ArtistDto> artists,
      required this.tracks,
      required final List<Copyright> copyrights,
      required this.label,
      required this.popularity})
      : _images = images,
        _artists = artists,
        _copyrights = copyrights;

  factory _$AlbumDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlbumDtoImplFromJson(json);

  @override
  @JsonKey(name: 'album_type')
  final String albumType;
  @override
  @JsonKey(name: 'total_tracks')
  final int totalTracks;
  @override
  final String href;
  @override
  final String id;
  final List<Image> _images;
  @override
  List<Image> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final String name;
  @override
  @JsonKey(name: 'release_date')
  final String releaseDate;
  @override
  @JsonKey(name: 'release_date_precision')
  final String releaseDatePrecision;
  @override
  final String type;
  @override
  final String uri;
  final List<ArtistDto> _artists;
  @override
  List<ArtistDto> get artists {
    if (_artists is EqualUnmodifiableListView) return _artists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_artists);
  }

  @override
  final Tracks tracks;
  final List<Copyright> _copyrights;
  @override
  List<Copyright> get copyrights {
    if (_copyrights is EqualUnmodifiableListView) return _copyrights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_copyrights);
  }

  @override
  final String label;
  @override
  final int popularity;

  @override
  String toString() {
    return 'AlbumDto(albumType: $albumType, totalTracks: $totalTracks, href: $href, id: $id, images: $images, name: $name, releaseDate: $releaseDate, releaseDatePrecision: $releaseDatePrecision, type: $type, uri: $uri, artists: $artists, tracks: $tracks, copyrights: $copyrights, label: $label, popularity: $popularity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlbumDtoImpl &&
            (identical(other.albumType, albumType) ||
                other.albumType == albumType) &&
            (identical(other.totalTracks, totalTracks) ||
                other.totalTracks == totalTracks) &&
            (identical(other.href, href) || other.href == href) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.releaseDatePrecision, releaseDatePrecision) ||
                other.releaseDatePrecision == releaseDatePrecision) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.uri, uri) || other.uri == uri) &&
            const DeepCollectionEquality().equals(other._artists, _artists) &&
            (identical(other.tracks, tracks) || other.tracks == tracks) &&
            const DeepCollectionEquality()
                .equals(other._copyrights, _copyrights) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      albumType,
      totalTracks,
      href,
      id,
      const DeepCollectionEquality().hash(_images),
      name,
      releaseDate,
      releaseDatePrecision,
      type,
      uri,
      const DeepCollectionEquality().hash(_artists),
      tracks,
      const DeepCollectionEquality().hash(_copyrights),
      label,
      popularity);

  /// Create a copy of AlbumDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlbumDtoImplCopyWith<_$AlbumDtoImpl> get copyWith =>
      __$$AlbumDtoImplCopyWithImpl<_$AlbumDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlbumDtoImplToJson(
      this,
    );
  }
}

abstract class _AlbumDto implements AlbumDto {
  factory _AlbumDto(
      {@JsonKey(name: 'album_type') required final String albumType,
      @JsonKey(name: 'total_tracks') required final int totalTracks,
      required final String href,
      required final String id,
      required final List<Image> images,
      required final String name,
      @JsonKey(name: 'release_date') required final String releaseDate,
      @JsonKey(name: 'release_date_precision')
      required final String releaseDatePrecision,
      required final String type,
      required final String uri,
      required final List<ArtistDto> artists,
      required final Tracks tracks,
      required final List<Copyright> copyrights,
      required final String label,
      required final int popularity}) = _$AlbumDtoImpl;

  factory _AlbumDto.fromJson(Map<String, dynamic> json) =
      _$AlbumDtoImpl.fromJson;

  @override
  @JsonKey(name: 'album_type')
  String get albumType;
  @override
  @JsonKey(name: 'total_tracks')
  int get totalTracks;
  @override
  String get href;
  @override
  String get id;
  @override
  List<Image> get images;
  @override
  String get name;
  @override
  @JsonKey(name: 'release_date')
  String get releaseDate;
  @override
  @JsonKey(name: 'release_date_precision')
  String get releaseDatePrecision;
  @override
  String get type;
  @override
  String get uri;
  @override
  List<ArtistDto> get artists;
  @override
  Tracks get tracks;
  @override
  List<Copyright> get copyrights;
  @override
  String get label;
  @override
  int get popularity;

  /// Create a copy of AlbumDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlbumDtoImplCopyWith<_$AlbumDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Tracks _$TracksFromJson(Map<String, dynamic> json) {
  return _Tracks.fromJson(json);
}

/// @nodoc
mixin _$Tracks {
  String get href => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  dynamic get next => throw _privateConstructorUsedError;
  int get offset => throw _privateConstructorUsedError;
  dynamic get previous => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  List<Item> get items => throw _privateConstructorUsedError;

  /// Serializes this Tracks to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Tracks
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TracksCopyWith<Tracks> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TracksCopyWith<$Res> {
  factory $TracksCopyWith(Tracks value, $Res Function(Tracks) then) =
      _$TracksCopyWithImpl<$Res, Tracks>;
  @useResult
  $Res call(
      {String href,
      int limit,
      dynamic next,
      int offset,
      dynamic previous,
      int total,
      List<Item> items});
}

/// @nodoc
class _$TracksCopyWithImpl<$Res, $Val extends Tracks>
    implements $TracksCopyWith<$Res> {
  _$TracksCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Tracks
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? href = null,
    Object? limit = null,
    Object? next = freezed,
    Object? offset = null,
    Object? previous = freezed,
    Object? total = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      href: null == href
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as dynamic,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as dynamic,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TracksImplCopyWith<$Res> implements $TracksCopyWith<$Res> {
  factory _$$TracksImplCopyWith(
          _$TracksImpl value, $Res Function(_$TracksImpl) then) =
      __$$TracksImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String href,
      int limit,
      dynamic next,
      int offset,
      dynamic previous,
      int total,
      List<Item> items});
}

/// @nodoc
class __$$TracksImplCopyWithImpl<$Res>
    extends _$TracksCopyWithImpl<$Res, _$TracksImpl>
    implements _$$TracksImplCopyWith<$Res> {
  __$$TracksImplCopyWithImpl(
      _$TracksImpl _value, $Res Function(_$TracksImpl) _then)
      : super(_value, _then);

  /// Create a copy of Tracks
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? href = null,
    Object? limit = null,
    Object? next = freezed,
    Object? offset = null,
    Object? previous = freezed,
    Object? total = null,
    Object? items = null,
  }) {
    return _then(_$TracksImpl(
      href: null == href
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as dynamic,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as dynamic,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TracksImpl implements _Tracks {
  _$TracksImpl(
      {required this.href,
      required this.limit,
      this.next,
      required this.offset,
      this.previous,
      required this.total,
      required final List<Item> items})
      : _items = items;

  factory _$TracksImpl.fromJson(Map<String, dynamic> json) =>
      _$$TracksImplFromJson(json);

  @override
  final String href;
  @override
  final int limit;
  @override
  final dynamic next;
  @override
  final int offset;
  @override
  final dynamic previous;
  @override
  final int total;
  final List<Item> _items;
  @override
  List<Item> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'Tracks(href: $href, limit: $limit, next: $next, offset: $offset, previous: $previous, total: $total, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TracksImpl &&
            (identical(other.href, href) || other.href == href) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            const DeepCollectionEquality().equals(other.next, next) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            const DeepCollectionEquality().equals(other.previous, previous) &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      href,
      limit,
      const DeepCollectionEquality().hash(next),
      offset,
      const DeepCollectionEquality().hash(previous),
      total,
      const DeepCollectionEquality().hash(_items));

  /// Create a copy of Tracks
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TracksImplCopyWith<_$TracksImpl> get copyWith =>
      __$$TracksImplCopyWithImpl<_$TracksImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TracksImplToJson(
      this,
    );
  }
}

abstract class _Tracks implements Tracks {
  factory _Tracks(
      {required final String href,
      required final int limit,
      final dynamic next,
      required final int offset,
      final dynamic previous,
      required final int total,
      required final List<Item> items}) = _$TracksImpl;

  factory _Tracks.fromJson(Map<String, dynamic> json) = _$TracksImpl.fromJson;

  @override
  String get href;
  @override
  int get limit;
  @override
  dynamic get next;
  @override
  int get offset;
  @override
  dynamic get previous;
  @override
  int get total;
  @override
  List<Item> get items;

  /// Create a copy of Tracks
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TracksImplCopyWith<_$TracksImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  List<ArtistDto> get artists => throw _privateConstructorUsedError;
  @JsonKey(name: 'disc_number')
  int get discNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration_ms')
  int get durationMs => throw _privateConstructorUsedError;
  bool get explicit => throw _privateConstructorUsedError;
  String get href => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'preview_url')
  String? get previewUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'track_number')
  int get trackNumber => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get uri => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_local')
  bool get isLocal => throw _privateConstructorUsedError;

  /// Serializes this Item to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res, Item>;
  @useResult
  $Res call(
      {List<ArtistDto> artists,
      @JsonKey(name: 'disc_number') int discNumber,
      @JsonKey(name: 'duration_ms') int durationMs,
      bool explicit,
      String href,
      String id,
      String name,
      @JsonKey(name: 'preview_url') String? previewUrl,
      @JsonKey(name: 'track_number') int trackNumber,
      String type,
      String uri,
      @JsonKey(name: 'is_local') bool isLocal});
}

/// @nodoc
class _$ItemCopyWithImpl<$Res, $Val extends Item>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Item
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
    Object? name = null,
    Object? previewUrl = freezed,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      previewUrl: freezed == previewUrl
          ? _value.previewUrl
          : previewUrl // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$ItemImplCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$ItemImplCopyWith(
          _$ItemImpl value, $Res Function(_$ItemImpl) then) =
      __$$ItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ArtistDto> artists,
      @JsonKey(name: 'disc_number') int discNumber,
      @JsonKey(name: 'duration_ms') int durationMs,
      bool explicit,
      String href,
      String id,
      String name,
      @JsonKey(name: 'preview_url') String? previewUrl,
      @JsonKey(name: 'track_number') int trackNumber,
      String type,
      String uri,
      @JsonKey(name: 'is_local') bool isLocal});
}

/// @nodoc
class __$$ItemImplCopyWithImpl<$Res>
    extends _$ItemCopyWithImpl<$Res, _$ItemImpl>
    implements _$$ItemImplCopyWith<$Res> {
  __$$ItemImplCopyWithImpl(_$ItemImpl _value, $Res Function(_$ItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of Item
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
    Object? name = null,
    Object? previewUrl = freezed,
    Object? trackNumber = null,
    Object? type = null,
    Object? uri = null,
    Object? isLocal = null,
  }) {
    return _then(_$ItemImpl(
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      previewUrl: freezed == previewUrl
          ? _value.previewUrl
          : previewUrl // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$ItemImpl implements _Item {
  _$ItemImpl(
      {required final List<ArtistDto> artists,
      @JsonKey(name: 'disc_number') required this.discNumber,
      @JsonKey(name: 'duration_ms') required this.durationMs,
      required this.explicit,
      required this.href,
      required this.id,
      required this.name,
      @JsonKey(name: 'preview_url') this.previewUrl,
      @JsonKey(name: 'track_number') required this.trackNumber,
      required this.type,
      required this.uri,
      @JsonKey(name: 'is_local') required this.isLocal})
      : _artists = artists;

  factory _$ItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemImplFromJson(json);

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
  final String name;
  @override
  @JsonKey(name: 'preview_url')
  final String? previewUrl;
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
    return 'Item(artists: $artists, discNumber: $discNumber, durationMs: $durationMs, explicit: $explicit, href: $href, id: $id, name: $name, previewUrl: $previewUrl, trackNumber: $trackNumber, type: $type, uri: $uri, isLocal: $isLocal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemImpl &&
            const DeepCollectionEquality().equals(other._artists, _artists) &&
            (identical(other.discNumber, discNumber) ||
                other.discNumber == discNumber) &&
            (identical(other.durationMs, durationMs) ||
                other.durationMs == durationMs) &&
            (identical(other.explicit, explicit) ||
                other.explicit == explicit) &&
            (identical(other.href, href) || other.href == href) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.previewUrl, previewUrl) ||
                other.previewUrl == previewUrl) &&
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
      name,
      previewUrl,
      trackNumber,
      type,
      uri,
      isLocal);

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      __$$ItemImplCopyWithImpl<_$ItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemImplToJson(
      this,
    );
  }
}

abstract class _Item implements Item {
  factory _Item(
      {required final List<ArtistDto> artists,
      @JsonKey(name: 'disc_number') required final int discNumber,
      @JsonKey(name: 'duration_ms') required final int durationMs,
      required final bool explicit,
      required final String href,
      required final String id,
      required final String name,
      @JsonKey(name: 'preview_url') final String? previewUrl,
      @JsonKey(name: 'track_number') required final int trackNumber,
      required final String type,
      required final String uri,
      @JsonKey(name: 'is_local') required final bool isLocal}) = _$ItemImpl;

  factory _Item.fromJson(Map<String, dynamic> json) = _$ItemImpl.fromJson;

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
  String get name;
  @override
  @JsonKey(name: 'preview_url')
  String? get previewUrl;
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

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Copyright _$CopyrightFromJson(Map<String, dynamic> json) {
  return _Copyright.fromJson(json);
}

/// @nodoc
mixin _$Copyright {
  String get text => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  /// Serializes this Copyright to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Copyright
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CopyrightCopyWith<Copyright> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CopyrightCopyWith<$Res> {
  factory $CopyrightCopyWith(Copyright value, $Res Function(Copyright) then) =
      _$CopyrightCopyWithImpl<$Res, Copyright>;
  @useResult
  $Res call({String text, String type});
}

/// @nodoc
class _$CopyrightCopyWithImpl<$Res, $Val extends Copyright>
    implements $CopyrightCopyWith<$Res> {
  _$CopyrightCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Copyright
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CopyrightImplCopyWith<$Res>
    implements $CopyrightCopyWith<$Res> {
  factory _$$CopyrightImplCopyWith(
          _$CopyrightImpl value, $Res Function(_$CopyrightImpl) then) =
      __$$CopyrightImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, String type});
}

/// @nodoc
class __$$CopyrightImplCopyWithImpl<$Res>
    extends _$CopyrightCopyWithImpl<$Res, _$CopyrightImpl>
    implements _$$CopyrightImplCopyWith<$Res> {
  __$$CopyrightImplCopyWithImpl(
      _$CopyrightImpl _value, $Res Function(_$CopyrightImpl) _then)
      : super(_value, _then);

  /// Create a copy of Copyright
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? type = null,
  }) {
    return _then(_$CopyrightImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CopyrightImpl implements _Copyright {
  _$CopyrightImpl({required this.text, required this.type});

  factory _$CopyrightImpl.fromJson(Map<String, dynamic> json) =>
      _$$CopyrightImplFromJson(json);

  @override
  final String text;
  @override
  final String type;

  @override
  String toString() {
    return 'Copyright(text: $text, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CopyrightImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text, type);

  /// Create a copy of Copyright
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CopyrightImplCopyWith<_$CopyrightImpl> get copyWith =>
      __$$CopyrightImplCopyWithImpl<_$CopyrightImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CopyrightImplToJson(
      this,
    );
  }
}

abstract class _Copyright implements Copyright {
  factory _Copyright({required final String text, required final String type}) =
      _$CopyrightImpl;

  factory _Copyright.fromJson(Map<String, dynamic> json) =
      _$CopyrightImpl.fromJson;

  @override
  String get text;
  @override
  String get type;

  /// Create a copy of Copyright
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CopyrightImplCopyWith<_$CopyrightImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
