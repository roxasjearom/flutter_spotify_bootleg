part of 'category_list_bloc.dart';

sealed class CategoryListEvent {
  const CategoryListEvent();
}

final class CategoryListFetched extends CategoryListEvent {}
