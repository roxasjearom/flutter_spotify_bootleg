part of 'favorite_list_bloc.dart';

enum FavoriteListStatus { initial, success, failure }

final class FavoriteListState extends Equatable {
  const FavoriteListState({
    this.status = FavoriteListStatus.initial,
    this.favoriteTracks = const <Track>[],
  });

  final FavoriteListStatus status;
  final List<Track> favoriteTracks;

  FavoriteListState copyWith({
    FavoriteListStatus? status,
    List<Track>? favoriteTracks,
  }) {
    return FavoriteListState(
      status: status ?? this.status,
      favoriteTracks: favoriteTracks ?? this.favoriteTracks,
    );
  }

  @override
  List<Object> get props => [status, favoriteTracks];
}
