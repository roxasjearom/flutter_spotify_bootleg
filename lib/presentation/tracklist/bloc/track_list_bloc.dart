import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_bootleg/domain/models/album_details.dart';
import 'package:flutter_spotify_bootleg/domain/models/api_failure.dart';
import 'package:flutter_spotify_bootleg/domain/repository/favorites_repository.dart';
import 'package:flutter_spotify_bootleg/infrastructure/local/entity/favorite_track_entity.dart';
import 'package:flutter_spotify_bootleg/domain/models/track.dart';
import 'package:flutter_spotify_bootleg/domain/repository/spotify_repository.dart';

part 'track_list_event.dart';
part 'track_list_state.dart';

class TrackListBloc extends Bloc<TrackListEvent, TrackListState> {
  TrackListBloc({
    required String id,
    required SpotifyRepository spotifyRepository,
    required FavoritesRepository favoritesRepository,
  })  : _id = id,
        _spotifyRepository = spotifyRepository,
        _favoritesRepository = favoritesRepository,
        super(const TrackListState()) {
    _trackListSubscription =
        spotifyRepository.getAlbumTracksStream(_id).listen((favorites) {
      add(TrackListStreamFetched(_id));
    });
    on<TrackListFetched>(_onFetched);

    on<TrackListStreamFetched>(_onStreamFetched);

    on<FavoriteTrackAdded>(_onFavoriteTrackAdded);

    on<FavoriteTrackRemoved>(_onFavoriteTrackRemoved);
  }

  final String _id;
  final SpotifyRepository _spotifyRepository;
  final FavoritesRepository _favoritesRepository;

  late StreamSubscription<List<Track>> _trackListSubscription;

  Future<void> _onStreamFetched(
    TrackListStreamFetched event,
    Emitter<TrackListState> emit,
  ) async {
    try {
      final tracks =
          await _spotifyRepository.getAlbumTracksStream(event.id).first;
      emit(
        state.copyWith(
          status: TrackListStatus.success,
          tracks: tracks,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: TrackListStatus.failure));
    }
  }

  Future<void> _onFetched(
    TrackListFetched event,
    Emitter<TrackListState> emit,
  ) async {
    Either<ApiFailure, AlbumDetails> albumDetailsResponse;
    switch (event.sourceType) {
      case SourceType.category:
        // TODO: Update this case.
        albumDetailsResponse =
            await _spotifyRepository.getAlbumDetails(event.id);
      case SourceType.artist:
        albumDetailsResponse =
            await _spotifyRepository.getArtistTopTracks(event.id);
      case SourceType.album:
        albumDetailsResponse =
            await _spotifyRepository.getAlbumDetails(event.id);
    }

    albumDetailsResponse.fold((failure) {
      emit(state.copyWith(status: TrackListStatus.failure));
    },
        (albumDetails) => emit(
              state.copyWith(
                status: TrackListStatus.success,
                name: albumDetails.name,
                artist: albumDetails.artist,
                imageUrl: albumDetails.imageUrl,
                //tracks: [...state.tracks, ...albumDetails.tracks],
              ),
            ));
  }

  Future<void> _onFavoriteTrackAdded(
      FavoriteTrackAdded event, Emitter<TrackListState> emit) async {
    try {
      final favoriteTrack =
          FavoriteTrack(event.track.id, event.track.title, event.track.artist);
      await _favoritesRepository.addToFavorites(event.track);
    } catch (_) {
      emit(state.copyWith(status: TrackListStatus.failure));
    }
  }

  Future<void> _onFavoriteTrackRemoved(
      FavoriteTrackRemoved event, Emitter<TrackListState> emit) async {
    try {
      await _favoritesRepository.removeFromFavorites(event.track);
    } catch (_) {
      emit(state.copyWith(status: TrackListStatus.failure));
    }
  }

  @override
  Future<void> close() {
    _trackListSubscription.cancel();
    return super.close();
  }
}
