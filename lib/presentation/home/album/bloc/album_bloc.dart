import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_bootleg/domain/models/models.dart';
import 'package:flutter_spotify_bootleg/domain/repository/spotify_repository.dart';

part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  AlbumBloc({
    required SpotifyRepository homeRepository,
  })  : _homeRepository = homeRepository,
        super(const AlbumState()) {
    on<AlbumFetched>(_onFetched);
  }

  final SpotifyRepository _homeRepository;

  Future<void> _onFetched(
    AlbumFetched event,
    Emitter<AlbumState> emit,
  ) async {
    final albumsResult = await _homeRepository.getAlbums();
    albumsResult.fold(
        (failure) => emit(state.copyWith(status: AlbumStatus.failure)),
        (albums) => emit(
              state.copyWith(
                status: AlbumStatus.success,
                albums: [...state.albums, ...albums],
              ),
            ));
  }
}
