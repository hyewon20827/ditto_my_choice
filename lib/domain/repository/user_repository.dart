import 'package:ditto/domain/entity/Auth/user.dart';

import '../../core/network/api_response.dart';
import '../entity/Auth/social_login.dart';

abstract interface class UserRepository {
  Future<User> getUserInfo(String idToken);
}