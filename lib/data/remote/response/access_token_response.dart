import 'package:freezed_annotation/freezed_annotation.dart';

part 'access_token_response.g.dart';
part 'access_token_response.freezed.dart';

@freezed
class AccessTokenResponse with _$AccessTokenResponse {
  const factory AccessTokenResponse({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'token_type') required String tokenType,
    @JsonKey(name: 'expires_in') required int expiresIn,
  }) = _AccessTokenResponse;

  factory AccessTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenResponseFromJson(json);
}
