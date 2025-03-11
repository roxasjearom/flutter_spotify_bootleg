import 'package:dio/dio.dart';
import 'package:flutter_spotify_bootleg/infrastructure/remote/service/authentication_service.dart';
import 'package:flutter_spotify_bootleg/infrastructure/remote/authentication/token_manager.dart';
import 'package:flutter_spotify_bootleg/infrastructure/remote/response/access_token_response.dart';

class TokenInterceptor extends Interceptor {
  final TokenManager tokenManager;
  final AuthenticationService authenticationService;

  TokenInterceptor(this.tokenManager, this.authenticationService);

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 &&
        err.requestOptions.headers['Authorization'] != null) {
      try {
        final newAccessTokenResponse = await _getNewAccessToken();
        final newAccessToken = newAccessTokenResponse.accessToken;

        await tokenManager.saveAccessToken(newAccessToken);
        
        err.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
        // Retry the request with the new token.
        final response = await Dio().fetch(err.requestOptions);
        handler.resolve(response);
        return;
      } catch (e) {
        // Handle error during token refresh.
        handler.next(err);
        return;
      }
    }

    // If not a 401 with Authorization header, or refresh fails, proceed with the original error.
    handler.next(err);
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await _getAccessToken();
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    handler.next(options);
  }

  Future<String?> _getAccessToken() async {
    try {
      final accessToken = tokenManager.getAccessToken();
      if (accessToken != null) {
        return accessToken;
      }
      final newAccessTokenResponse = await _getNewAccessToken();
      return newAccessTokenResponse.accessToken;
    } catch (e) {
      return null;
    }
  }

  Future<AccessTokenResponse> _getNewAccessToken() async {
    return authenticationService.getAccessToken();
  }
}
