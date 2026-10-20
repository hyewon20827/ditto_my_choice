import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

final tokenStorageProvider = Provider<TokenStorage>((ref) {
  final storage = ref.watch(secureStorageProvider);
  return TokenStorage(storage);
});

class TokenStorage {
  TokenStorage(this._storage);

  final FlutterSecureStorage _storage;

  static const _accessTokenKey = 'access_token';

  Future<String?> getAccessToken() {
    return _storage.read(key: _accessTokenKey);
  }

  Future<void> saveAccessToken(String token) {
    return _storage.write(
      key: _accessTokenKey,
      value: token,
    );
  }

  Future<void> deleteAccessToken() {
    return _storage.delete(key: _accessTokenKey);
  }
}