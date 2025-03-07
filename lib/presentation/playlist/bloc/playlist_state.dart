part of 'playlist_bloc.dart';

enum PlaylistStatus { initial, success, failure }

final class PlaylistState extends Equatable {
  const PlaylistState({
    this.status = PlaylistStatus.initial,
    this.playlists = const <Playlist>[],
    this.isGridMode = true,
  });

  final PlaylistStatus status;
  final List<Playlist> playlists;
  final bool isGridMode;

  PlaylistState copyWith({
    PlaylistStatus? status,
    List<Playlist>? playlists,
    bool? isGridMode,
  }) {
    return PlaylistState(
      status: status ?? this.status,
      playlists: playlists ?? this.playlists,
      isGridMode: isGridMode ?? this.isGridMode,
    );
  }

  @override
  List<Object> get props => [status, playlists, isGridMode];
}
