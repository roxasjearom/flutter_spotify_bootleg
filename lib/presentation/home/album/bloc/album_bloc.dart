import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_bootleg/domain/models/models.dart';
import 'package:flutter_spotify_bootleg/domain/repository/home_repository.dart';

part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  AlbumBloc({
    required HomeRepository homeRepository,
  })  : _homeRepository = homeRepository,
        super(const AlbumState()) {
    on<AlbumFetched>(_onFetched);
  }

  final HomeRepository _homeRepository;

  Future<void> _onFetched(
    AlbumFetched event,
    Emitter<AlbumState> emit,
  ) async {
    try {
      final albums = await _homeRepository.getAlbums();
      emit(
        state.copyWith(
          status: AlbumStatus.success,
          albums: [...state.albums, ...albums],
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: AlbumStatus.failure));
    }
  }
}
