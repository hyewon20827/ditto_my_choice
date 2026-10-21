import 'package:ditto/domain/entity/Auth/dev_login.dart';

import '../entity/Auth/social_login.dart';

abstract interface class AuthRepository {
  Future<DevLogin> getDevToken(String xDevLoginKey);
  Future<SocialLogin> socialLogin(String channel, String idToken);
}