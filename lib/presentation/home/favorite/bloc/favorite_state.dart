part of 'favorite_bloc.dart';

enum FavoriteStatus { initial, success, failure }

final class FavoriteState extends Equatable {
  const FavoriteState({
    this.status = FavoriteStatus.initial,
    this.favorites = const <Track>[],
  });

  final FavoriteStatus status;
  final List<Track> favorites;

  FavoriteState copyWith({
    FavoriteStatus? status,
    List<Track>? favorites,
  }) {
    return FavoriteState(
      status: status ?? this.status,
      favorites: favorites ?? this.favorites,
    );
  }

  @override
  List<Object> get props => [status, favorites];
}
