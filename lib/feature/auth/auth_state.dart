import 'package:ditto/domain/entity/Auth/social_login.dart';

import '../../domain/entity/Auth/User.dart';

class AuthState {
  final bool isLoading;
  final SocialLogin? auth;
  final String? error;

  const AuthState({
    this.isLoading = false,
    this.auth,
    this.error,
  });
}