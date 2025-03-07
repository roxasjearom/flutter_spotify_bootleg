import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/models/artist.dart';
import '../../../../domain/repository/home_repository.dart';

part 'artist_event.dart';
part 'artist_state.dart';

class ArtistBloc extends Bloc<ArtistEvent, ArtistState> {
  ArtistBloc({
    required HomeRepository homeRepository,
  })  : _homeRepository = homeRepository,
        super(const ArtistState()) {
    on<ArtistFetched>(_onFetched);
  }

  final HomeRepository _homeRepository;

  Future<void> _onFetched(
    ArtistFetched event,
    Emitter<ArtistState> emit,
  ) async {
    try {
      final artists = _homeRepository.getArtists();
      emit(
        state.copyWith(
          status: ArtistStatus.success,
          artists: [...state.artists, ...artists],
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: ArtistStatus.failure));
    }
  }
}
