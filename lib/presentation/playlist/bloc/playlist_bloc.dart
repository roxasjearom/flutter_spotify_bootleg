import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_bootleg/domain/models/playlist.dart';
import 'package:flutter_spotify_bootleg/domain/repository/home_repository.dart';

part 'playlist_event.dart';
part 'playlist_state.dart';

class PlaylistBloc extends Bloc<PlaylistEvent, PlaylistState> {
  PlaylistBloc({
    required HomeRepository homeRepository,
  })  : _homeRepository = homeRepository,
        super(const PlaylistState()) {
    on<PlaylistFetched>(_onFetched);
    on<ToggleViewMode>(_onToggleViewMode);
  }

  final HomeRepository _homeRepository;

  Future<void> _onFetched(
    PlaylistFetched event,
    Emitter<PlaylistState> emit,
  ) async {
    try {
      final playlists = _homeRepository.getPlaylists("id");
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
