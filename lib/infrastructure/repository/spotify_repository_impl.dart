import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_spotify_bootleg/domain/models/api_failure.dart';
import 'package:flutter_spotify_bootleg/infrastructure/local/dao/favorite_track_dao.dart';
import 'package:flutter_spotify_bootleg/infrastructure/mapper/album_mapper.dart';
import 'package:flutter_spotify_bootleg/infrastructure/mapper/artist_mapper.dart';
import 'package:flutter_spotify_bootleg/infrastructure/mapper/category_mapper.dart';
import 'package:flutter_spotify_bootleg/infrastructure/mapper/track_mapper.dart';
import 'package:flutter_spotify_bootleg/infrastructure/remote/response/artist_tracks_response.dart';
import 'package:flutter_spotify_bootleg/infrastructure/remote/response/artists_response.dart';
import 'package:flutter_spotify_bootleg/infrastructure/remote/service/spotify_service.dart';
import 'package:flutter_spotify_bootleg/domain/models/models.dart';
import 'package:flutter_spotify_bootleg/domain/models/track.dart';
import '../../domain/repository/spotify_repository.dart';

class SpotifyRepositoryImpl implements SpotifyRepository {
  SpotifyRepositoryImpl(this._favoriteTrackDao, this.spotifyService);

  final FavoriteTrackDao _favoriteTrackDao;
  final SpotifyService spotifyService;

  @override
  Future<Either<ApiFailure, List<Category>>> getSeveralCategories(
      int limit) async {
    try {
      final categoryResponse = await spotifyService.getSeveralCategories(limit);
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
  Future<Either<ApiFailure, List<Album>>> getSeveralAlbums(String ids) async {
    try {
      final albumResponse = await spotifyService.getSeveralAlbums(ids);
      final albumItems = albumResponse.albums;
      return Right(albumItems.map((albumItem) => albumItem.toAlbum()).toList());
    } on DioException catch (e) {
      return Left(ApiFailure(e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<ApiFailure, List<Artist>>> getSeveralArtists(String ids) async {
    try {
      final artistsResponse = await spotifyService.getSeveralArtists(ids);
      final artistItems = artistsResponse.artists;
      return Right(
          artistItems.map((artistItem) => artistItem.toArtist()).toList());
    } on DioException catch (e) {
      return Left(ApiFailure(e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
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
  Stream<List<Track>> getFavoritesStream() {
    final favoriteSongsStream = _favoriteTrackDao.getAllFavoritesStream();

    return favoriteSongsStream.map((favoriteSongList) => favoriteSongList
        .map((favoriteSong) => favoriteSong.toTrack(false))
        .toList());
  }

  @override
  Future<List<Track>> getFavorites() async {
    final favorites = await _favoriteTrackDao.getFavorites();
    return favorites.map((favorite) => favorite.toTrack(true)).toList();
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
  Future<Either<ApiFailure, AlbumDetails>> getArtistTopTracks(String id) async {
    try {
      final results = await Future.wait([
        spotifyService.getArtistDetails(id),
        spotifyService.getArtistTopTracks(id),
      ]);

      final artistDetails = results[0] as ArtistDto;
      final artistTopTracks = results[1] as ArtistTracksResponse;

      final songs =
          artistTopTracks.tracks.map((track) => track.toTrack(false)).toList();

      return Right(AlbumDetails(
        id: id,
        name: artistDetails.name,
        artist: artistDetails.name,
        imageUrl: artistDetails.images?.firstOrNull?.url ?? "",
        tracks: songs,
      ));
    } on DioException catch (e) {
      return Left(ApiFailure(e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }
}
