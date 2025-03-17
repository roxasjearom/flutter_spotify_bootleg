import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_bootleg/domain/models/track.dart';
import 'package:flutter_spotify_bootleg/domain/repository/favorites_repository.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc({
    required FavoritesRepository favoritesRepository,
  })  : _favoritesRepository = favoritesRepository,
        super(const FavoriteState()) {
    _favoritesSubscription =
        favoritesRepository.getFavoritesStream().listen((favorites) {
      add(FavoriteFetched());
    });
    on<FavoriteFetched>(_onFetched);
  }

  final FavoritesRepository _favoritesRepository;

  late StreamSubscription<List<Track>> _favoritesSubscription;

  Future<void> _onFetched(
    FavoriteFetched event,
    Emitter<FavoriteState> emit,
  ) async {
    try {
      final favorites = await _favoritesRepository.getFavoritesStream().first;
      emit(
        state.copyWith(
          status: FavoriteStatus.success,
          favorites: favorites,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: FavoriteStatus.failure));
    }
  }

  @override
  Future<void> close() {
    _favoritesSubscription.cancel();
    return super.close();
  }
}
