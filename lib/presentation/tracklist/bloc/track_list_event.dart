part of 'track_list_bloc.dart';

sealed class TrackListEvent extends Equatable {
  const TrackListEvent();

  @override
  List<Object> get props => [];
}

final class TrackListFetched extends TrackListEvent {
  final String id;
  final SourceType sourceType;
  const TrackListFetched(this.id, this.sourceType);
}

final class TrackListStreamFetched extends TrackListEvent {
  final String id;
  final SourceType sourceType;
  const TrackListStreamFetched(this.id, this.sourceType);
}

class FavoriteTrackAdded extends TrackListEvent {
  final Track track;
  const FavoriteTrackAdded(this.track);
}

class FavoriteTrackRemoved extends TrackListEvent {
  final Track track;
  const FavoriteTrackRemoved(this.track);
}
