import 'package:flutter_spotify_bootleg/data/remote/response/categories_response.dart';
import 'package:flutter_spotify_bootleg/domain/models/category.dart';

extension CategoryDtoToCategory on CategoryDto {
  Category toCategory() {
    return Category(
      id: id,
      name: name,
      iconUrl: icons.firstOrNull?.url ?? "",
    );
  }
}
