part of 'favorite_list_bloc.dart';

enum FavoriteListStatus { initial, success, failure }

final class FavoriteListState extends Equatable {
  const FavoriteListState({
    this.status = FavoriteListStatus.initial,
    this.songs = const <Song>[],
  });

  final FavoriteListStatus status;
  final List<Song> songs;

  FavoriteListState copyWith({
    FavoriteListStatus? status,
    List<Song>? songs,
  }) {
    return FavoriteListState(
      status: status ?? this.status,
      songs: songs ?? this.songs,
    );
  }

  @override
  List<Object> get props => [status, songs];
}
