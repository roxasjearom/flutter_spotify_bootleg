import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_bootleg/domain/models/playlist.dart';
import 'package:flutter_spotify_bootleg/domain/repository/spotify_repository.dart';

part 'playlist_event.dart';
part 'playlist_state.dart';

class PlaylistBloc extends Bloc<PlaylistEvent, PlaylistState> {
  PlaylistBloc({
    required SpotifyRepository spotifyRepository,
  })  : _spotifyRepository = spotifyRepository,
        super(const PlaylistState()) {
    on<PlaylistFetched>(_onFetched);
    on<ToggleViewMode>(_onToggleViewMode);
  }

  final SpotifyRepository _spotifyRepository;

  Future<void> _onFetched(
    PlaylistFetched event,
    Emitter<PlaylistState> emit,
  ) async {
    try {
      final playlists = _spotifyRepository.getPlaylists(event.categoryId);
      emit(
        state.copyWith(
          status: PlaylistStatus.success,
          playlists: [...state.playlists, ...playlists],
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: PlaylistStatus.failure));
    }
  }

  void _onToggleViewMode(ToggleViewMode event, Emitter<PlaylistState> emit) {
    emit(state.copyWith(isGridMode: !state.isGridMode));
  }
}
