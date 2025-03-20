import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_bootleg/domain/models/category.dart';
import 'package:flutter_spotify_bootleg/domain/repository/spotify_repository.dart';

part 'category_list_event.dart';
part 'category_list_state.dart';

class CategoryListBloc extends Bloc<CategoryListEvent, CategoryListState> {
  CategoryListBloc({
    required SpotifyRepository homeRepository,
  })  : _homeRepository = homeRepository,
        super(const CategoryListState()) {
    on<CategoryListFetched>(_onFetched);
  }

  final SpotifyRepository _homeRepository;

  Future<void> _onFetched(
    CategoryListFetched event,
    Emitter<CategoryListState> emit,
  ) async {
    final categoriesResult = await _homeRepository.getSeveralCategories(20);
    categoriesResult.fold(
        (failure) => emit(state.copyWith(status: CategoryListStatus.failure)),
        (categories) => emit(
              state.copyWith(
                status: CategoryListStatus.success,
                categories: [...state.categories, ...categories],
              ),
            ));
  }
}
