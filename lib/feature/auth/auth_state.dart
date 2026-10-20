import 'package:ditto/domain/entity/Auth/auth.dart';

import '../../domain/entity/Auth/User.dart';

class AuthState {
  final bool isLoading;
  final Auth? auth;
  final String? error;

  const AuthState({
    this.isLoading = false,
    this.auth,
    this.error,
  });
}