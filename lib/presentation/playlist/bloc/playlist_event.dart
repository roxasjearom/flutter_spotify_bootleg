part of 'playlist_bloc.dart';

sealed class PlaylistEvent {}

final class PlaylistFetched extends PlaylistEvent {}

final class ToggleViewMode extends PlaylistEvent {}
