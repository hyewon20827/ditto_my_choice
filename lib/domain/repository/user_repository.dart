import 'package:ditto/domain/entity/Auth/user.dart';

import '../entity/Auth/auth.dart';

abstract interface class UserRepository {
  Future<User> getUserInfo(String idToken);
}