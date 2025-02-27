import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_bootleg/domain/models/category.dart';
import 'package:flutter_spotify_bootleg/domain/repository/home_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc({
    required HomeRepository homeRepository,
  }) : _homeRepository = homeRepository,
  super(const CategoryState()) {
    on<CategoryFetched>(_onFetched);
  }

  final HomeRepository _homeRepository;

  Future<void> _onFetched(
    CategoryFetched event,
    Emitter<CategoryState> emit,
  ) async {
    try {
      final categories = await _homeRepository.getCategories();
      emit(
        state.copyWith(
          status: CategoryStatus.success,
          categories: [...state.categories, ...categories],
        ),
      );

    } catch (_) {
      emit(state.copyWith(status: CategoryStatus.failure));
    }
  }

}
