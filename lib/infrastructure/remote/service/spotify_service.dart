import 'package:dio/dio.dart';
import 'package:flutter_spotify_bootleg/core/config/apis.dart';
import 'package:flutter_spotify_bootleg/env/env.dart';
import 'package:flutter_spotify_bootleg/infrastructure/remote/response/album_response.dart';
import 'package:flutter_spotify_bootleg/infrastructure/remote/response/artists_response.dart';
import 'package:flutter_spotify_bootleg/infrastructure/remote/response/categories_response.dart';
import 'package:flutter_spotify_bootleg/infrastructure/remote/response/artist_tracks_response.dart';
import 'package:retrofit/retrofit.dart';

part 'spotify_service.g.dart';

@RestApi(baseUrl: Env.spotifyUrl)
abstract class SpotifyService {
  factory SpotifyService(Dio dio, {String baseUrl}) = _SpotifyService;

  @GET(Apis.categories)
  Future<CategoriesResponse> getSeveralCategories(
    @Query("limit") int limit,
  );

  @GET(Apis.albums)
  Future<AlbumResponse> getSeveralAlbums(
    @Query("ids") String ids,
  );

  @GET(Apis.albumDetails)
  Future<AlbumDto> getAlbumDetails(
    @Path("id") String id,
  );

  @GET(Apis.artists)
  Future<ArtistsResponse> getSeveralArtists(
    @Query("ids") String ids,
  );

  @GET(Apis.artistTopTracks)
  Future<ArtistTracksResponse> getArtistTopTracks(
    @Path("id") String id,
  );

  @GET(Apis.artistDetails)
  Future<ArtistDto> getArtistDetails(
    @Path("id") String id,
  );

}
