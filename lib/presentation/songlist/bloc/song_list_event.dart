part of 'song_list_bloc.dart';

sealed class SongListEvent extends Equatable {
  const SongListEvent();

  @override
  List<Object> get props => [];
}

final class SongListFetched extends SongListEvent {
  final String id;
  final SourceType sourceType;
  const SongListFetched(this.id, this.sourceType);
}

class FavoriteSongAdded extends SongListEvent {
  final Song song;
  const FavoriteSongAdded(this.song);
}

class FavoriteSongRemoved extends SongListEvent {
  final Song song;
  const FavoriteSongRemoved(this.song);
}
