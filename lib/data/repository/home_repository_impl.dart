import 'package:flutter_spotify_bootleg/data/local/dao/favorite_song_dao.dart';
import 'package:flutter_spotify_bootleg/data/mapper/album_mapper.dart';
import 'package:flutter_spotify_bootleg/data/mapper/category_mapper.dart';
import 'package:flutter_spotify_bootleg/data/mapper/song_mapper.dart';
import 'package:flutter_spotify_bootleg/data/remote/authentication/authentication_service.dart';
import 'package:flutter_spotify_bootleg/data/remote/spotify_service.dart';
import 'package:flutter_spotify_bootleg/domain/models/models.dart';
import 'package:flutter_spotify_bootleg/domain/models/song.dart';
import '../../domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(
      this._favoriteSongDao, this.authenticationService, this.spotifyService);

  final AuthenticationService authenticationService;
  final FavoriteSongDao _favoriteSongDao;
  final SpotifyService spotifyService;

  @override
  Future<List<Category>> getCategories() async {
    final categoryResponse = await spotifyService.getCategories();
    final categoryItems = categoryResponse.categories.items;
    return categoryItems
        .map((categoryItem) => categoryItem.toCategory())
        .toList();
  }

  @override
  Future<List<Album>> getAlbums() async {
    final albumResponse = await spotifyService.getAlbums(
        "36OmXvGRKAY2zICbVtItoa,5MgFxCKMfta2fQequyHHrt,5AEDGbliTTfjOB8TSm1sxt,0hvT3yIEysuuvkK73vgdcW");
    final albumItems = albumResponse.albums;
    return albumItems.map((albumItem) => albumItem.toAlbum()).toList();
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
        id: "36OmXvGRKAY2zICbVtItoa",
        name: "Kung Alam Mo Lang",
        artist: "Hev Abi",
        imageUrl:
            "https://i.scdn.co/image/ab67616d00001e027300c1e7edcdbd15a42e1579",
        songs: [
          Song(
              id: "1YpgamasVsAnYTfOYJOEB5",
              title: "Introhan Ko Lang",
              artist: "Hev Abi"),
          Song(
              id: "0o2geA4kEWYPtuik3fs9Ai",
              title: "Binibiroksi",
              artist: "Hev Abi"),
          Song(
              id: "57Z7lSnhwx82laEb6rdZPB",
              title: "Alam Mo Ba Girl",
              artist: "Hev Abi"),
          Song(
              id: "35Vt1L1KBP2YoWfErB0FAy",
              title: "Sumugal",
              artist: "Hev Abi"),
          Song(
              id: "0qvtcqVOqdxeR4ipNLBl77",
              title: "From Torillo, With Love",
              artist: "Hev Abi"),
          Song(
              id: "4wZTvLi0khNRqqz4i5XhdV",
              title: "Walang Alam",
              artist: "Hev Abi"),
          Song(id: "6exTC7vovfqzHqh5t4oAtm", title: "Still", artist: "Hev Abi"),
          Song(
              id: "5XErV3kyTKbyaQGovj8wwo",
              title: "drugr4ts",
              artist: "Hev Abi"),
          Song(
              id: "0lJxErLtFRQ8BjKI7bNbQW",
              title: "Pasaway Mode",
              artist: "Hev Abi"),
          Song(
              id: "4WYfu1sbBaSj09J9zXnG7F",
              title: "Kulay Downtown",
              artist: "Hev Abi"),
          Song(
              id: "56fQ03sPqx2TWiX2JllFjL",
              title: "Antagonista",
              artist: "Hev Abi"),
          Song(
              id: "7hGExswhBJ50VPifCdOjjw",
              title: "C2 Boyz",
              artist: "Hev Abi"),
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

  @override
  List<Playlist> getPlaylists(String categoryId) {
    return [
      Playlist(
          id: "2b2fRiWsKiQe2eCtegSFMh",
          name: "ANISONG | Anime Soundtrack & JPOP Hits 2025",
          imageUrl:
              "https://image-cdn-ak.spotifycdn.com/image/ab67706c0000da84677b870dd28cf1fd535d65b7"),
      Playlist(
          id: "3QhXIS5QiiyhNlD8RBdSZO",
          name: "NBA 2K14 Soundtrack",
          imageUrl:
              "https://image-cdn-ak.spotifycdn.com/image/ab67706c0000d72c890c4d5f87c2467b926d0a1c"),
      Playlist(
          id: "5IMCUGJ9U4yEt6EGffRu3R",
          name: "Need for Speed Unbound",
          imageUrl:
              "https://image-cdn-ak.spotifycdn.com/image/ab67706c0000d72c07c8a1619749568c566b7f92"),
      Playlist(
          id: "0qLCcq59NwT6D2qqLHg2Ni",
          name: "Driving Music For Japan",
          imageUrl:
              "https://image-cdn-ak.spotifycdn.com/image/ab67706c0000da849c16d011f5cd7b45ae0d5feb"),
      Playlist(
          id: "0vvXsWCC9xrXsKd4FyS8kM",
          name: "Lofi Girl - beats to relax/study to",
          imageUrl:
              "https://image-cdn-ak.spotifycdn.com/image/ab67706c0000da848bc80c95b9d248cf462c0bd1"),
      Playlist(
          id: "2j3fK4PAMujbPMp4pCTHKK",
          name: "NFS Most Wanted 2012 Soundtrack",
          imageUrl:
              "https://image-cdn-ak.spotifycdn.com/image/ab67706c0000da845406cc684e16b89c9c2cadc0"),
      Playlist(
          id: "4ntnSwspFI1gIr0IQGncyD",
          name: "Gundam : Iron-Blooded Orphans OST",
          imageUrl:
              "https://image-cdn-fa.spotifycdn.com/image/ab67706c0000da8405ae8511a1392bb6e63dd071"),
      Playlist(
          id: "7brYxyYJTVoipfDCbrq0fP",
          name: "COLDPLAY PH 2024",
          imageUrl:
              "https://image-cdn-ak.spotifycdn.com/image/ab67706c0000da8463ceedc3bd8e08d6af00a8db"),
    ];
  }

  @override
  Future<String> getToken() async {
    final tokenResponse = await authenticationService.getAccessToken();
    return tokenResponse.accessToken;
  }
}
