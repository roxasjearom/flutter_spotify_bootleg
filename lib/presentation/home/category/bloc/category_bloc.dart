import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_bootleg/domain/models/category.dart';
import 'package:flutter_spotify_bootleg/domain/repository/spotify_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc({
    required SpotifyRepository homeRepository,
  })  : _homeRepository = homeRepository,
        super(const CategoryState()) {
    on<CategoryFetched>(_onFetched);
  }

  final SpotifyRepository _homeRepository;

  Future<void> _onFetched(
    CategoryFetched event,
    Emitter<CategoryState> emit,
  ) async {
    final categoriesResult = await _homeRepository.getCategories();
    categoriesResult.fold(
        (failure) => emit(state.copyWith(status: CategoryStatus.failure)),
        (categories) => emit(
              state.copyWith(
                status: CategoryStatus.success,
                categories: [...state.categories, ...categories],
              ),
            ));
  }
}
