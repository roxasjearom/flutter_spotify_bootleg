import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_bootleg/infrastructure/local/dao/favorite_song_dao.dart';
import 'package:flutter_spotify_bootleg/di/service_locator.dart';
import 'package:flutter_spotify_bootleg/domain/models/song.dart';
import 'package:flutter_spotify_bootleg/domain/repository/home_repository.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoriteSongDao songDao = getIt.get<FavoriteSongDao>();
  
  FavoriteBloc({
    required HomeRepository homeRepository,
  }) : _homeRepository = homeRepository,
  super(const FavoriteState()) {
    on<FavoriteFetched>(_onFetched);
  }

  final HomeRepository _homeRepository;

  Future<void> _onFetched(FavoriteFetched event,
    Emitter<FavoriteState> emit,) async {
      try {
        final favorites = await _homeRepository.getFavorites();
        emit(
        state.copyWith(
          status: FavoriteStatus.success,
          favorites: [...state.favorites, ...favorites],
        ),
      );
      } catch(_) {
        emit(state.copyWith(status: FavoriteStatus.failure));
      }
  }
}
