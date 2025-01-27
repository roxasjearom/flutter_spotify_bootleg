part of 'category_bloc.dart';

enum CategoryStatus { initial, success, failure }

final class CategoryState extends Equatable {
  const CategoryState({
    this.status = CategoryStatus.initial,
    this.posts = const <Category>[],
    this.hasReachedMax = false,
  });

  final CategoryStatus status;
  final List<Category> posts;
  final bool hasReachedMax;

  CategoryState copyWith({
    CategoryStatus? status,
    List<Category>? posts,
    bool? hasReachedMax,
  }) {
    return CategoryState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [status, posts, hasReachedMax];
}