import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_bootleg/infrastructure/local/dao/favorite_track_dao.dart';
import 'package:flutter_spotify_bootleg/infrastructure/local/entity/favorite_track_entity.dart';
import 'package:flutter_spotify_bootleg/domain/models/track.dart';
import 'package:flutter_spotify_bootleg/domain/repository/spotify_repository.dart';

part 'favorite_list_event.dart';
part 'favorite_list_state.dart';

class FavoriteListBloc extends Bloc<FavoriteListEvent, FavoriteListState> {
  FavoriteListBloc({
    required SpotifyRepository homeRepository,
    required FavoriteTrackDao favoriteSongDao,
  })  : _homeRepository = homeRepository,
        _favoriteSongDao = favoriteSongDao,
        super(const FavoriteListState()) {
    on<FavoriteListFetched>(_onFetched);

    on<FavoriteTrackAdded>(_onFavoriteFavoriteAdded);

    on<FavoriteTrackRemoved>(_onFavoriteFavoriteRemoved);
  }

  final SpotifyRepository _homeRepository;
  final FavoriteTrackDao _favoriteSongDao;

  Future<void> _onFetched(
    FavoriteListFetched event,
    Emitter<FavoriteListState> emit,
  ) async {
    try {
      final favorites = await _homeRepository.getFavorites();
      emit(
        state.copyWith(
          status: FavoriteListStatus.success,
          songs: [...state.songs, ...favorites],
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: FavoriteListStatus.failure));
    }
  }

  Future<void> _onFavoriteFavoriteAdded(
      FavoriteTrackAdded event, Emitter<FavoriteListState> emit) async {
    try {
      final favoriteFavorite =
          FavoriteTrack(event.track.id, event.track.title, event.track.artist);
      await _favoriteSongDao.insertFavorite(favoriteFavorite);
    } catch (_) {
      emit(state.copyWith(status: FavoriteListStatus.failure));
    }
  }

  Future<void> _onFavoriteFavoriteRemoved(
      FavoriteTrackRemoved event, Emitter<FavoriteListState> emit) async {
    try {
      await _favoriteSongDao.deleteFavorite(event.track.id);
    } catch (_) {
      emit(state.copyWith(status: FavoriteListStatus.failure));
    }
  }
}
