import 'package:ditto/domain/entity/Auth/user.dart';

class Auth {
  final String accessToken;
  final String tokenType;
  final int expiresIn;
  final User user;

  const Auth({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.user
  });
}