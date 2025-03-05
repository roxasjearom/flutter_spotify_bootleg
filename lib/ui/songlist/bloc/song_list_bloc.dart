import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_bootleg/data/local/dao/favorite_song_dao.dart';
import 'package:flutter_spotify_bootleg/data/local/entity/favorite_song_entity.dart';
import 'package:flutter_spotify_bootleg/domain/models/song.dart';
import 'package:flutter_spotify_bootleg/domain/repository/home_repository.dart';

part 'song_list_event.dart';
part 'song_list_state.dart';

class SongListBloc extends Bloc<SongListEvent, SongListState> {
  SongListBloc({
    required HomeRepository homeRepository,
    required FavoriteSongDao favoriteSongDao,
  })  : _homeRepository = homeRepository,
        _favoriteSongDao = favoriteSongDao,
        super(const SongListState()) {
    on<SongListFetched>(_onFetched);

    on<FavoriteSongAdded>(_onFavoriteSongAdded);

    on<FavoriteSongRemoved>(_onFavoriteSongRemoved);
  }

  final HomeRepository _homeRepository;
  final FavoriteSongDao _favoriteSongDao;

  Future<void> _onFetched(
    SongListFetched event,
    Emitter<SongListState> emit,
  ) async {
    try {
      final albumDetails = await _homeRepository.getAlbumDetails(event.id);
      emit(
        state.copyWith(
          status: SongListStatus.success,
          name: albumDetails.name,
          artist: albumDetails.artist,
          imageUrl: albumDetails.imageUrl,
          songs: [...state.songs, ...albumDetails.songs],
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: SongListStatus.failure));
    }
  }

  Future<void> _onFavoriteSongAdded(
      FavoriteSongAdded event, Emitter<SongListState> emit) async {
    try {
      final favoriteSong =
          FavoriteSong(event.song.id, event.song.title, event.song.artist);
      await _favoriteSongDao.insertFavorite(favoriteSong);
    } catch (_) {
      emit(state.copyWith(status: SongListStatus.failure));
    }
  }

  Future<void> _onFavoriteSongRemoved(
      FavoriteSongRemoved event, Emitter<SongListState> emit) async {
    try {
      await _favoriteSongDao.deleteFavorite(event.song.id);
    } catch (_) {
      emit(state.copyWith(status: SongListStatus.failure));
    }
  }
}
