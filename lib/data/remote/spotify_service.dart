import 'package:dio/dio.dart';
import 'package:flutter_spotify_bootleg/data/remote/response/album_response.dart';
import 'package:flutter_spotify_bootleg/data/remote/response/categories_response.dart';
import 'package:flutter_spotify_bootleg/di/service_locator.dart';
import 'package:retrofit/retrofit.dart';

part 'spotify_service.g.dart';

const apiVersion = "v1";

@RestApi(baseUrl: spotifyUrl)
abstract class SpotifyService {
  factory SpotifyService(Dio dio, {String baseUrl}) = _SpotifyService;

  @GET("$apiVersion/browse/categories")
  Future<CategoriesResponse> getCategories({
    @Query("limit") int limit = 8,
  });

  @GET("$apiVersion/albums")
  Future<AlbumResponse> getAlbums(
    @Query("ids") String ids,
  );

  @GET("$apiVersion/albums/{id}")
  Future<AlbumDto> getAlbumDetails(
    @Path("id") String id,
  );
}
