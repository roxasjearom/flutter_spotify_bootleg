part of 'song_list_bloc.dart';

enum SongListStatus { initial, success, failure }

enum SourceType { category, artist, album }

final class SongListState extends Equatable {
  const SongListState({
    this.id = "",
    this.name = "",
    this.artist = "",
    this.imageUrl = "",
    this.status = SongListStatus.initial,
    this.sourceType = SourceType.album,
    this.songs = const <Song>[],
  });

  final String id;
  final String name;
  final String artist;
  final String imageUrl;
  final SongListStatus status;
  final SourceType sourceType;
  final List<Song> songs;

  SongListState copyWith({
    String? id,
    String? name,
    String? artist,
    String? imageUrl,
    SongListStatus? status,
    SourceType? sourceType,
    List<Song>? songs,
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
