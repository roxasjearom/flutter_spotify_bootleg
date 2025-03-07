part of 'album_bloc.dart';

enum AlbumStatus { initial, success, failure }

final class AlbumState extends Equatable {
  const AlbumState({
    this.status = AlbumStatus.initial,
    this.albums = const <Album>[],
  });

  final AlbumStatus status;
  final List<Album> albums;

  AlbumState copyWith({
    AlbumStatus? status,
    List<Album>? albums,
  }) {
    return AlbumState(
      status: status ?? this.status,
      albums: albums ?? this.albums,
    );
  }

  @override
  List<Object> get props => [status, albums];
}
