import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'CLIENT_ID')
  static const String clientId = _Env.clientId;

  @EnviedField(varName: 'CLIENT_SECRET')
  static const String clientSecret = _Env.clientSecret;

  @EnviedField(varName: 'ALBUM_IDS')
  static const String albumIds = _Env.albumIds;

  @EnviedField(varName: 'ARTIST_IDS')
  static const String artistIds = _Env.artistIds;
}
