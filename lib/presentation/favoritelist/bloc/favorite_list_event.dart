part of 'favorite_list_bloc.dart';

sealed class FavoriteListEvent extends Equatable {
  const FavoriteListEvent();

  @override
  List<Object> get props => [];
}

final class FavoriteListFetched extends FavoriteListEvent {}

class FavoriteTrackAdded extends FavoriteListEvent {
  final Track track;
  const FavoriteTrackAdded(this.track);
}

class FavoriteTrackRemoved extends FavoriteListEvent {
  final Track track;
  const FavoriteTrackRemoved(this.track);
}
