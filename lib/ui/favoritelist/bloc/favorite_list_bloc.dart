import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_bootleg/data/local/dao/favorite_song_dao.dart';
import 'package:flutter_spotify_bootleg/data/local/entity/favorite_song_entity.dart';
import 'package:flutter_spotify_bootleg/domain/models/song.dart';
import 'package:flutter_spotify_bootleg/domain/repository/home_repository.dart';

part 'favorite_list_event.dart';
part 'favorite_list_state.dart';

class FavoriteListBloc extends Bloc<FavoriteListEvent, FavoriteListState> {
  FavoriteListBloc({
    required HomeRepository homeRepository,
    required FavoriteSongDao favoriteSongDao,
  })  : _homeRepository = homeRepository,
        _favoriteSongDao = favoriteSongDao,
        super(const FavoriteListState()) {
    on<FavoriteListFetched>(_onFetched);

    on<FavoriteSongAdded>(_onFavoriteFavoriteAdded);

    on<FavoriteSongRemoved>(_onFavoriteFavoriteRemoved);
  }

  final HomeRepository _homeRepository;
  final FavoriteSongDao _favoriteSongDao;

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
      FavoriteSongAdded event, Emitter<FavoriteListState> emit) async {
    try {
      final favoriteFavorite =
          FavoriteSong(event.song.id, event.song.title, event.song.artist);
      await _favoriteSongDao.insertFavorite(favoriteFavorite);
    } catch (_) {
      emit(state.copyWith(status: FavoriteListStatus.failure));
    }
  }

  Future<void> _onFavoriteFavoriteRemoved(
      FavoriteSongRemoved event, Emitter<FavoriteListState> emit) async {
    try {
      await _favoriteSongDao.deleteFavorite(event.song.id);
    } catch (_) {
      emit(state.copyWith(status: FavoriteListStatus.failure));
    }
  }
}
