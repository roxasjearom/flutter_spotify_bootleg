import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {

  final SharedPreferences sharedPreference;

  TokenManager({required this.sharedPreference});

  Future<void> saveAccessToken(String accessToken) async {
    await sharedPreference.setString('token', accessToken);
  }
  String? getAccessToken() {
    return sharedPreference.getString('token');
  }

}
