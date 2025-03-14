import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_bootleg/domain/models/album_details.dart';
import 'package:flutter_spotify_bootleg/domain/models/api_failure.dart';
import 'package:flutter_spotify_bootleg/infrastructure/local/dao/favorite_track_dao.dart';
import 'package:flutter_spotify_bootleg/infrastructure/local/entity/favorite_track_entity.dart';
import 'package:flutter_spotify_bootleg/domain/models/track.dart';
import 'package:flutter_spotify_bootleg/domain/repository/spotify_repository.dart';

part 'track_list_event.dart';
part 'track_list_state.dart';

class TrackListBloc extends Bloc<TrackListEvent, SongListState> {
  TrackListBloc({
    required SpotifyRepository spotifyRepository,
    required FavoriteTrackDao favoriteSongDao,
  })  : _homeRepository = spotifyRepository,
        _favoriteSongDao = favoriteSongDao,
        super(const SongListState()) {
    on<TrackListFetched>(_onFetched);

    on<FavoriteTrackAdded>(_onFavoriteSongAdded);

    on<FavoriteTrackRemoved>(_onFavoriteSongRemoved);
  }

  final SpotifyRepository _homeRepository;
  final FavoriteTrackDao _favoriteSongDao;

  Future<void> _onFetched(
    TrackListFetched event,
    Emitter<SongListState> emit,
  ) async {
    Either<ApiFailure, AlbumDetails> albumDetailsResponse;
    switch(event.sourceType) {
      
      case SourceType.category:
      // TODO: Update this case.
        albumDetailsResponse = await _homeRepository.getAlbumDetails(event.id);
      case SourceType.artist:
        albumDetailsResponse = await _homeRepository.getArtistTopTracks(event.id);
      case SourceType.album:
        albumDetailsResponse = await _homeRepository.getAlbumDetails(event.id);
    }

    albumDetailsResponse.fold(
        (failure) {
          emit(state.copyWith(status: TrackListStatus.failure));
          },
        (albumDetails) => emit(
              state.copyWith(
                status: TrackListStatus.success,
                name: albumDetails.name,
                artist: albumDetails.artist,
                imageUrl: albumDetails.imageUrl,
                songs: [...state.songs, ...albumDetails.tracks],
              ),
            ));
  }

  Future<void> _onFavoriteSongAdded(
      FavoriteTrackAdded event, Emitter<SongListState> emit) async {
    try {
      final favoriteSong =
          FavoriteTrack(event.track.id, event.track.title, event.track.artist);
      await _favoriteSongDao.insertFavorite(favoriteSong);
    } catch (_) {
      emit(state.copyWith(status: TrackListStatus.failure));
    }
  }

  Future<void> _onFavoriteSongRemoved(
      FavoriteTrackRemoved event, Emitter<SongListState> emit) async {
    try {
      await _favoriteSongDao.deleteFavorite(event.song.id);
    } catch (_) {
      emit(state.copyWith(status: TrackListStatus.failure));
    }
  }
}
