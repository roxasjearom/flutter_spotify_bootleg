import 'package:flutter_spotify_bootleg/domain/models/models.dart';
import '../../domain/repository/home_repository.dart';

class FakeHomeRepositoryImpl implements HomeRepository {
  @override
  List<Category> getCategories() {
    return [
      Category(id: "0JQ5DAqbMKFQ00XGBls6ym", name: "Hip-Hop", iconUrl: "https://t.scdn.co/images/728ed47fc1674feb95f7ac20236eb6d7.jpeg"),
      Category(id: "0JQ5DAqbMKFQ00XGBls6th", name: "K-pop", iconUrl: "https://t.scdn.co/images/728ed47fc1674feb95f7ac20236eb6d7.jpeg"),
      Category(id: "0JQ5DAqbMKFQ00XGBls6as", name: "Classical", iconUrl: "https://t.scdn.co/images/728ed47fc1674feb95f7ac20236eb6d7.jpeg"),
      ];
  }

  @override
  List<Playlist> getAlbums() {
    return [
      Playlist(id: "05asd5FQVcs544", name: "Seinabo Sey", imageUrl: "https://i.scdn.co/image/ab67616d00001e02ff9ca10b55ce82ae553c8228"),
      Playlist(id: "05asd5FQVcs5b5f", name: "Skibidi", imageUrl: "https://i.scdn.co/image/ab67616d00001e02ff9ca10b55ce82ae553c8228"),
      Playlist(id: "05asd5FQVcs5bh", name: "Sigma Boy", imageUrl: "https://i.scdn.co/image/ab67616d00001e02ff9ca10b55ce82ae553c8228"),
    ];
  }
}