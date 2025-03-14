part of 'track_list_bloc.dart';

enum TrackListStatus { initial, success, failure }

enum SourceType { category, artist, album }

final class SongListState extends Equatable {
  const SongListState({
    this.id = "",
    this.name = "",
    this.artist = "",
    this.imageUrl = "",
    this.status = TrackListStatus.initial,
    this.sourceType = SourceType.album,
    this.songs = const <Track>[],
  });

  final String id;
  final String name;
  final String artist;
  final String imageUrl;
  final TrackListStatus status;
  final SourceType sourceType;
  final List<Track> songs;

  SongListState copyWith({
    String? id,
    String? name,
    String? artist,
    String? imageUrl,
    TrackListStatus? status,
    SourceType? sourceType,
    List<Track>? songs,
  }) {
    return SongListState(
      id: id ?? this.id,
      name: name ?? this.name,
      artist: artist ?? this.artist,
      imageUrl: imageUrl ?? this.imageUrl,
      status: status ?? this.status,
      sourceType: sourceType ?? this.sourceType,
      songs: songs ?? this.songs,
    );
  }

  @override
  List<Object> get props => [id, name, artist, status, songs];
}
