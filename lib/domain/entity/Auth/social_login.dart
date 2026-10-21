import 'package:ditto/domain/entity/Auth/user.dart';

class SocialLogin {
  final String accessToken;
  final String tokenType;
  final int expiresIn;
  final User? user;

  const SocialLogin({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    this.user
  });
}