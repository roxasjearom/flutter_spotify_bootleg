import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_bootleg/domain/models/models.dart';
import 'package:flutter_spotify_bootleg/domain/repository/spotify_repository.dart';
import 'package:flutter_spotify_bootleg/env/env.dart';

part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  AlbumBloc({
    required SpotifyRepository spotifyRepository,
  })  : _spotifyRepository = spotifyRepository,
        super(const AlbumState()) {
    on<AlbumFetched>(_onFetched);
  }

  final SpotifyRepository _spotifyRepository;

  Future<void> _onFetched(
    AlbumFetched event,
    Emitter<AlbumState> emit,
  ) async {
    final albumsResult = await _spotifyRepository.getSeveralAlbums(Env.albumIds);
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
