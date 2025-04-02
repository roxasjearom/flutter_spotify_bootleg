import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_bootleg/env/env.dart';

import '../../../../domain/models/artist.dart';
import '../../../../domain/repository/spotify_repository.dart';

part 'artist_event.dart';
part 'artist_state.dart';

class ArtistBloc extends Bloc<ArtistEvent, ArtistState> {
  ArtistBloc({
    required SpotifyRepository spotifyRepository,
  })  : _spotifyRepository = spotifyRepository,
        super(const ArtistState()) {
    on<ArtistFetched>(_onFetched);
  }

  final SpotifyRepository _spotifyRepository;

  Future<void> _onFetched(
    ArtistFetched event,
    Emitter<ArtistState> emit,
  ) async {
    final artistsResult = await _spotifyRepository.getSeveralArtists(Env.artistIds);
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
