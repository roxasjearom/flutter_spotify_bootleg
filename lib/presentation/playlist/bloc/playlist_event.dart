part of 'playlist_bloc.dart';

sealed class PlaylistEvent {
  const PlaylistEvent();
}

final class PlaylistFetched extends PlaylistEvent {
  final String categoryId;
  const PlaylistFetched(this.categoryId);
}

final class ToggleViewMode extends PlaylistEvent {}
