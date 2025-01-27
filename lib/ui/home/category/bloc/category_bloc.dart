import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_bootleg/domain/models/category.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(const CategoryState()) {
    on<CategoryFetched>(_onFetched);
  }

  Future<void> _onFetched(
    CategoryFetched event,
    Emitter<CategoryState> emit,
  ) async {
    //Call endpoint here
  }

}