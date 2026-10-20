import '../entity/Auth/auth.dart';

abstract interface class AuthRepository {
  Future<Auth> getDevToken(String xDevLoginKey);
  Future<Auth> socialLogin(String channel, String idToken);
}