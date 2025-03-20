part of 'category_list_bloc.dart';

enum CategoryListStatus { initial, success, failure }

final class CategoryListState extends Equatable {
  const CategoryListState({
    this.status = CategoryListStatus.initial,
    this.categories = const <Category>[],
  });

  final CategoryListStatus status;
  final List<Category> categories;

  CategoryListState copyWith({
    CategoryListStatus? status,
    List<Category>? categories,
  }) {
    return CategoryListState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
    );
  }

  @override
  List<Object> get props => [status, categories];
}
