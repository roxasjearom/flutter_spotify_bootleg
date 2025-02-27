import 'package:dio/dio.dart';
import 'package:flutter_spotify_bootleg/data/remote/response/access_token_response.dart';
import 'package:flutter_spotify_bootleg/di/service_locator.dart';
import 'package:retrofit/retrofit.dart';

part 'authentication_service.g.dart';

@RestApi(baseUrl: accountsUrl)
abstract class AuthenticationService {
  factory AuthenticationService(Dio dio, {String baseUrl}) =
      _AuthenticationService;

  @FormUrlEncoded()
  @POST("/api/token")
  Future<AccessTokenResponse> getAccessToken(
      {@Field("grant_type") String grantType = "client_credentials"});
}
