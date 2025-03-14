import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_response.freezed.dart';
part 'categories_response.g.dart';

@freezed
class CategoriesResponse with _$CategoriesResponse {
  factory CategoriesResponse({
    required Categories categories,
  }) = _CategoriesResponse;

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseFromJson(json);
}

@freezed
class Categories with _$Categories {
  factory Categories({
    required String href,
    required List<CategoryDto> items,
    required int limit,
    required String? next,
    required int offset,
    required int total,
  }) = _Categories;

  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);
}

@freezed
class IconDto with _$IconDto {
  factory IconDto({
    required int height,
    required String url,
    required int width,
  }) = _Icon;

  factory IconDto.fromJson(Map<String, dynamic> json) => _$IconDtoFromJson(json);
}

@freezed
class CategoryDto with _$CategoryDto {
  factory CategoryDto({
    required String href,
    required List<IconDto> icons,
    required String id,
    required String name,
  }) = _CategoryDto;

  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);
}
