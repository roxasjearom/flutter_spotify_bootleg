import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'SPOTIFY_URL')
  static const String spotifyUrl = _Env.spotifyUrl;

  @EnviedField(varName: 'ACCOUNTS_URL')
  static const String accountsUrl = _Env.accountsUrl;

  @EnviedField(varName: 'CONTENT_TYPE')
  static const String contentType = _Env.contentType;

  @EnviedField(varName: 'GRANT_TYPE')
  static const String grantType = _Env.grantType;

  @EnviedField(varName: 'CLIENT_ID')
  static const String clientId = _Env.clientId;

  @EnviedField(varName: 'CLIENT_SECRET')
  static const String clientSecret = _Env.clientSecret;

  @EnviedField(varName: 'ALBUM_IDS')
  static const String albumIds = _Env.albumIds;

  @EnviedField(varName: 'ARTIST_IDS')
  static const String artistIds = _Env.artistIds;
}
