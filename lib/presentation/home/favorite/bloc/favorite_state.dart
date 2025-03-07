part of 'favorite_bloc.dart';

enum FavoriteStatus { initial, success, failure }

final class FavoriteState extends Equatable {
  const FavoriteState({
    this.status = FavoriteStatus.initial,
    this.favorites = const <Song>[],
  });

  final FavoriteStatus status;
  final List<Song> favorites;

  FavoriteState copyWith({
    FavoriteStatus? status,
    List<Song>? favorites,
    bool? hasReachedMax,
  }) {
    return FavoriteState(
      status: status ?? this.status,
      favorites: favorites ?? this.favorites,
    );
  }

  @override
  List<Object> get props => [status, favorites];
}
