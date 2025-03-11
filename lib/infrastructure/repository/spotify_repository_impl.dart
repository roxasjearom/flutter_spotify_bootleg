import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_spotify_bootleg/domain/models/api_failure.dart';
import 'package:flutter_spotify_bootleg/infrastructure/local/dao/favorite_song_dao.dart';
import 'package:flutter_spotify_bootleg/infrastructure/mapper/album_mapper.dart';
import 'package:flutter_spotify_bootleg/infrastructure/mapper/category_mapper.dart';
import 'package:flutter_spotify_bootleg/infrastructure/mapper/song_mapper.dart';
import 'package:flutter_spotify_bootleg/infrastructure/remote/service/spotify_service.dart';
import 'package:flutter_spotify_bootleg/domain/models/models.dart';
import 'package:flutter_spotify_bootleg/domain/models/song.dart';
import '../../domain/repository/spotify_repository.dart';

class SpotifyRepositoryImpl implements SpotifyRepository {
  SpotifyRepositoryImpl(this._favoriteSongDao, this.spotifyService);

  final FavoriteSongDao _favoriteSongDao;
  final SpotifyService spotifyService;

  @override
  Future<Either<ApiFailure, List<Category>>> getCategories() async {
    try {
      final categoryResponse = await spotifyService.getCategories();
      final categoryItems = categoryResponse.categories.items;
      return Right(categoryItems
          .map((categoryItem) => categoryItem.toCategory())
          .toList());
    } on DioException catch (e) {
      return Left(ApiFailure(e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<ApiFailure, List<Album>>> getAlbums() async {
    try {
      final albumResponse = await spotifyService.getAlbums(
          "36OmXvGRKAY2zICbVtItoa,5MgFxCKMfta2fQequyHHrt,5AEDGbliTTfjOB8TSm1sxt,0hvT3yIEysuuvkK73vgdcW");
      final albumItems = albumResponse.albums;
      return Right(albumItems.map((albumItem) => albumItem.toAlbum()).toList());
    } on DioException catch (e) {
      return Left(ApiFailure(e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
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
  Future<Either<ApiFailure, AlbumDetails>> getAlbumDetails(String id) async {
    try {
      final albumDetailsResponse = await spotifyService.getAlbumDetails(id);
      return Right(albumDetailsResponse.toAlbumDetails());
    } on DioException catch (e) {
      return Left(ApiFailure(e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Stream<List<Song>> getFavoritesStream() {
    final favoriteSongsStream = _favoriteSongDao.getAllFavoritesStream();

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
}
