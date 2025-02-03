part of 'category_bloc.dart';

enum CategoryStatus { initial, success, failure }

final class CategoryState extends Equatable {
  const CategoryState({
    this.status = CategoryStatus.initial,
    this.categories = const <Category>[],
  });

  final CategoryStatus status;
  final List<Category> categories;

  CategoryState copyWith({
    CategoryStatus? status,
    List<Category>? categories,
    bool? hasReachedMax,
  }) {
    return CategoryState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
    );
  }

  @override
  List<Object> get props => [status, categories];
}