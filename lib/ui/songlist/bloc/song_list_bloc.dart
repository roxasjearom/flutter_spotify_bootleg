import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_bootleg/domain/models/song.dart';
import 'package:flutter_spotify_bootleg/domain/repository/home_repository.dart';

part 'song_list_event.dart';
part 'song_list_state.dart';

class SongListBloc extends Bloc<SongListEvent, SongListState> {
  SongListBloc({
    required HomeRepository homeRepository,
  })  : _homeRepository = homeRepository,
        super(const SongListState()) {
    on<SongListFetched>(_onFetched);
  }

  final HomeRepository _homeRepository;

  Future<void> _onFetched(
    SongListFetched event,
    Emitter<SongListState> emit,
  ) async {
    try {
      final albumDetails = _homeRepository.getAlbumDetails(event.id);
      emit(
        state.copyWith(
          status: SongListStatus.success,
          name: albumDetails.name,
          artist: albumDetails.artist,
          imageUrl: albumDetails.imageUrl,
          songs: [...state.songs, ...albumDetails.songs],
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: SongListStatus.failure));
    }
  }
}
