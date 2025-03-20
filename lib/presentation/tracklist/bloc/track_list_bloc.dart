import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_bootleg/domain/enumerations/source_type.dart';
import 'package:flutter_spotify_bootleg/domain/models/header_details.dart';
import 'package:flutter_spotify_bootleg/domain/models/api_failure.dart';
import 'package:flutter_spotify_bootleg/domain/repository/favorites_repository.dart';
import 'package:flutter_spotify_bootleg/domain/models/track.dart';
import 'package:flutter_spotify_bootleg/domain/repository/spotify_repository.dart';

part 'track_list_event.dart';
part 'track_list_state.dart';

class TrackListBloc extends Bloc<TrackListEvent, TrackListState> {
  TrackListBloc({
    required String id,
    required SourceType sourceType,
    required SpotifyRepository spotifyRepository,
    required FavoritesRepository favoritesRepository,
  })  : _id = id,
        _sourceType = sourceType,
        _spotifyRepository = spotifyRepository,
        _favoritesRepository = favoritesRepository,
        super(const TrackListState()) {
    _trackListSubscription =
        _getTracksStream(_id, _sourceType).listen((tracks) {
      add(TrackListStreamFetched(_id, _sourceType));
    });
    on<HeaderDetailsFetched>(_onHeaderDetailsFetched);

    on<TrackListStreamFetched>(_onTrackListStreamFetched);

    on<FavoriteTrackAdded>(_onFavoriteTrackAdded);

    on<FavoriteTrackRemoved>(_onFavoriteTrackRemoved);
  }

  final String _id;
  final SourceType _sourceType;
  final SpotifyRepository _spotifyRepository;
  final FavoritesRepository _favoritesRepository;

  late StreamSubscription<List<Track>> _trackListSubscription;

  Future<void> _onTrackListStreamFetched(
    TrackListStreamFetched event,
    Emitter<TrackListState> emit,
  ) async {
    try {
      List<Track> tracks = await _getTracksStream(event.id, event.sourceType).first;
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

  Stream<List<Track>> _getTracksStream(String id, SourceType sourceType) {
    Stream<List<Track>> tracks;
    switch (sourceType) {
      case SourceType.artist:
        tracks = _spotifyRepository.getArtistTopTracksStream(id);
      case SourceType.album:
        tracks = _spotifyRepository.getAlbumTracksStream(id);
    }
    return tracks;
  }

  Future<void> _onHeaderDetailsFetched(
    HeaderDetailsFetched event,
    Emitter<TrackListState> emit,
  ) async {
    Either<ApiFailure, HeaderDetails> albumDetailsResponse;
    switch (event.sourceType) {
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
                sourceType: event.sourceType,
                subHeaderValue: albumDetails.subHeaderValue,
              ),
            ));
  }

  Future<void> _onFavoriteTrackAdded(
      FavoriteTrackAdded event, Emitter<TrackListState> emit) async {
    try {
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
