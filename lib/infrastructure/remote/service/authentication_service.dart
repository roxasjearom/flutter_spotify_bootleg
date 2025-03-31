import 'package:dio/dio.dart';
import 'package:flutter_spotify_bootleg/core/config/Apis.dart';
import 'package:flutter_spotify_bootleg/env/env.dart';
import 'package:flutter_spotify_bootleg/infrastructure/remote/response/access_token_response.dart';
import 'package:retrofit/retrofit.dart';

part 'authentication_service.g.dart';

@RestApi(baseUrl: Env.accountsUrl)
abstract class AuthenticationService {
  factory AuthenticationService(Dio dio, {String baseUrl}) =
      _AuthenticationService;

  @FormUrlEncoded()
  @POST(Apis.token)
  Future<AccessTokenResponse> getAccessToken(
      {@Field("grant_type") String grantType = "client_credentials"});
}
