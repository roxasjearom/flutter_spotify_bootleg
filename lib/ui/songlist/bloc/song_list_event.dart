part of 'song_list_bloc.dart';

sealed class SongListEvent extends Equatable {
  const SongListEvent();

  @override
  List<Object> get props => [];
}

final class SongListFetched extends SongListEvent {
  const SongListFetched(this.id);
  final String id;
}
