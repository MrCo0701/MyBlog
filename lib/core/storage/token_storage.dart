import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  static const _accessToken = 'access';
  static const _refreshToken = 'refresh';
  static const _storage = FlutterSecureStorage();

  static Future<void> saveToken(String access, String refresh) async {
    await _storage.write(key: _accessToken, value: access);
    await _storage.write(key: _refreshToken, value: refresh);
  }

  static Future<String?> getAccessToken() => _storage.read(key: _accessToken);

  static Future<String?> getRefreshToken() => _storage.read(key: _refreshToken);

  static Future<void> cleanToken() => _storage.deleteAll();
}
