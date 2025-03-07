part of 'artist_bloc.dart';

enum ArtistStatus { initial, success, failure }

final class ArtistState extends Equatable {
  const ArtistState({
    this.status = ArtistStatus.initial,
    this.artists = const <Artist>[],
  });

  final ArtistStatus status;
  final List<Artist> artists;

  ArtistState copyWith({
    ArtistStatus? status,
    List<Artist>? artists,
  }) {
    return ArtistState(
      status: status ?? this.status,
      artists: artists ?? this.artists,
    );
  }

  @override
  List<Object> get props => [status, artists];
}
