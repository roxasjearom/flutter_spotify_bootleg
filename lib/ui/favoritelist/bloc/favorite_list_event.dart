part of 'favorite_list_bloc.dart';

sealed class FavoriteListEvent extends Equatable {
  const FavoriteListEvent();

  @override
  List<Object> get props => [];
}

final class FavoriteListFetched extends FavoriteListEvent {}

class FavoriteSongAdded extends FavoriteListEvent {
  final Song song;
  const FavoriteSongAdded(this.song);
}

class FavoriteSongRemoved extends FavoriteListEvent {
  final Song song;
  const FavoriteSongRemoved(this.song);
}
