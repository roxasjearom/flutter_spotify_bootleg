import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/models/artist.dart';
import '../../../../domain/repository/spotify_repository.dart';

part 'artist_event.dart';
part 'artist_state.dart';

class ArtistBloc extends Bloc<ArtistEvent, ArtistState> {
  ArtistBloc({
    required SpotifyRepository homeRepository,
  })  : _homeRepository = homeRepository,
        super(const ArtistState()) {
    on<ArtistFetched>(_onFetched);
  }

  final SpotifyRepository _homeRepository;

  Future<void> _onFetched(
    ArtistFetched event,
    Emitter<ArtistState> emit,
  ) async {
    final artistsResult = await _homeRepository.getArtists();
    artistsResult.fold(
        (failure) => emit(state.copyWith(status: ArtistStatus.failure)),
        (artists) => emit(
              state.copyWith(
                status: ArtistStatus.success,
                artists: [...state.artists, ...artists],
              ),
            ));
  }
}
