import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_bootleg/domain/repository/favorites_repository.dart';
import 'package:flutter_spotify_bootleg/domain/models/track.dart';

part 'favorite_list_event.dart';
part 'favorite_list_state.dart';

class FavoriteListBloc extends Bloc<FavoriteListEvent, FavoriteListState> {
  FavoriteListBloc({
    required FavoritesRepository favoritesRepository,
  })  : _favoritesRepository = favoritesRepository,
        super(const FavoriteListState()) {
    _favoritesSubscription =
        favoritesRepository.getFavoritesStream().listen((favorites) {
      add(FavoriteListFetched());
    });
    on<FavoriteListFetched>(_onFetched);

    on<FavoriteTrackAdded>(_onFavoriteFavoriteAdded);

    on<FavoriteTrackRemoved>(_onFavoriteFavoriteRemoved);
  }

  final FavoritesRepository _favoritesRepository;

  late StreamSubscription<List<Track>> _favoritesSubscription;

  Future<void> _onFetched(
    FavoriteListFetched event,
    Emitter<FavoriteListState> emit,
  ) async {
    try {
      final favorites = await _favoritesRepository.getFavoritesStream().first;
      emit(
        state.copyWith(
          status: FavoriteListStatus.success,
          songs: favorites,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: FavoriteListStatus.failure));
    }
  }

  Future<void> _onFavoriteFavoriteAdded(
      FavoriteTrackAdded event, Emitter<FavoriteListState> emit) async {
    try {
      await _favoritesRepository.addToFavorites(event.track);
    } catch (_) {
      emit(state.copyWith(status: FavoriteListStatus.failure));
    }
  }

  Future<void> _onFavoriteFavoriteRemoved(
      FavoriteTrackRemoved event, Emitter<FavoriteListState> emit) async {
    try {
      await _favoritesRepository.removeFromFavorites(event.track);
    } catch (_) {
      emit(state.copyWith(status: FavoriteListStatus.failure));
    }
  }

  @override
  Future<void> close() {
    _favoritesSubscription.cancel();
    return super.close();
  }
}
