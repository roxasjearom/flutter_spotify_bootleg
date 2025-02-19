import 'package:flutter_spotify_bootleg/data/local/dao/favorite_song_dao.dart';
import 'package:flutter_spotify_bootleg/data/mapper/song_mapper.dart';
import 'package:flutter_spotify_bootleg/domain/models/models.dart';
import 'package:flutter_spotify_bootleg/domain/models/song.dart';
import '../../domain/repository/home_repository.dart';

class FakeHomeRepositoryImpl implements HomeRepository {
  FakeHomeRepositoryImpl(this._favoriteSongDao);

  final FavoriteSongDao _favoriteSongDao;

  @override
  List<Category> getCategories() {
    return [
      Category(
          id: "0JQ5DAqbMKFQ00XGBls6ym",
          name: "Hip-Hop",
          iconUrl:
              "https://t.scdn.co/images/728ed47fc1674feb95f7ac20236eb6d7.jpeg"),
      Category(
          id: "0JQ5DAqbMKFQ00XGBls6th",
          name: "K-pop",
          iconUrl:
              "https://t.scdn.co/images/728ed47fc1674feb95f7ac20236eb6d7.jpeg"),
      Category(
          id: "0JQ5DAqbMKFQ00XGBls6as",
          name: "Classical",
          iconUrl:
              "https://t.scdn.co/images/728ed47fc1674feb95f7ac20236eb6d7.jpeg"),
    ];
  }

  @override
  List<Album> getAlbums() {
    return [
      Album(
          id: "382ObEPsp2rxGrnsizN5TX",
          name: "TRON: Legacy Reconfigured",
          imageUrl:
              "https://i.scdn.co/image/ab67616d00001e0226597c053b38c9cf93f8f3a9"),
      Album(
          id: "1A2GTWGtFfWp7KSQTwWOyo",
          name: "Human After All",
          imageUrl:
              "https://i.scdn.co/image/ab67616d00001e02d8601e15fa1b4351fe1fc6ae"),
      Album(
          id: "2noRn2Aes5aoNVsU6iWThc",
          name: "Discovery",
          imageUrl:
              "https://i.scdn.co/image/ab67616d00001e02b1f18dc3658aff286fa9f351"),
    ];
  }

  @override
  List<Artist> getArtists() {
    return [
      Artist(
        id: "2CIMQHirSU0MQqyYHq0eOx",
        name: "deadmau5",
        imageUrl:
            "https://i.scdn.co/image/ab6761610000517489ffabe57a25cedeca3309e7",
      ),
      Artist(
        id: "57dN52uHvrHOxijzpIgu3E",
        name: "Ratatat",
        imageUrl:
            "https://i.scdn.co/image/dc68dd24b45b74ecce9d4ed486423673d683ced3",
      ),
      Artist(
        id: "1vCWHaC5f2uS3yhpwWbIA6",
        name: "Avicii",
        imageUrl:
            "https://i.scdn.co/image/ab67616100005174ae07171f989fb39736674113",
      ),
    ];
  }

  @override
  AlbumDetails getAlbumDetails(String id) {
    return AlbumDetails(
        id: "292kifgxa7S78AuzA5NMpL",
        name: "Global Warming",
        artist: "Pitbull",
        imageUrl:
            "https://i.scdn.co/image/ab67616d0000b2732c5b24ecfa39523a75c993c4",
        songs: [
          Song(
              id: "292kifgxa7S78AuzA5NMpL",
              title: "Global Warming (feat. Sensato)",
              artist: "Pitbull"),
          Song(
              id: "3Tu7uWBecS6GsLsL8UONKn",
              title: "Don't Stop the Party (feat. TJR)",
              artist: "Pitbull"),
          Song(
              id: "0Hf4aIJpsN4Os2f0y0VqWl",
              title: "Feel This Moment (feat. Christina Aguilera)",
              artist: "Pitbull"),
          Song(
              id: "292kifgxa7S78AuzA5NMpL",
              title: "Global Warming (feat. Sensato)",
              artist: "Pitbull"),
          Song(
              id: "3Tu7uWBecS6GsLsL8UONKn",
              title: "Don't Stop the Party (feat. TJR)",
              artist: "Pitbull"),
          Song(
              id: "0Hf4aIJpsN4Os2f0y0VqWl",
              title: "Feel This Moment (feat. Christina Aguilera)",
              artist: "Pitbull"),
          Song(
              id: "292kifgxa7S78AuzA5NMpL",
              title: "Global Warming (feat. Sensato)",
              artist: "Pitbull"),
          Song(
              id: "3Tu7uWBecS6GsLsL8UONKn",
              title: "Don't Stop the Party (feat. TJR)",
              artist: "Pitbull"),
          Song(
              id: "0Hf4aIJpsN4Os2f0y0VqWl",
              title: "Feel This Moment (feat. Christina Aguilera)",
              artist: "Pitbull"),
          Song(
              id: "292kifgxa7S78AuzA5NMpL",
              title: "Global Warming (feat. Sensato)",
              artist: "Pitbull"),
          Song(
              id: "3Tu7uWBecS6GsLsL8UONKn",
              title: "Don't Stop the Party (feat. TJR)",
              artist: "Pitbull"),
          Song(
              id: "0Hf4aIJpsN4Os2f0y0VqWl",
              title: "Feel This Moment (feat. Christina Aguilera)",
              artist: "Pitbull"),
        ]);
  }

  @override
  Stream<List<Song>> getSongList(String id) {
    final favoriteSongsStream = _favoriteSongDao.getAllFavorites();

    return favoriteSongsStream.map((favoriteSongList) => favoriteSongList
        .map((favoriteSong) => favoriteSong.toSong(false))
        .toList());
  }

  @override
  Future<List<Song>> getFavorites() async {
    final favorites = await _favoriteSongDao.getFavorites();
    return favorites.map((favorite) => favorite.toSong(true)).toList();
  }
}
