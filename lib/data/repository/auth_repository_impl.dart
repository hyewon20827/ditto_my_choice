import 'package:ditto/data/api/auth_api.dart';
import 'package:ditto/data/model/social_login_request.dart';
import 'package:ditto/domain/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/api_response.dart';
import '../../domain/entity/Auth/auth.dart';
import '../model/auth_model.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final api = ref.watch(authApiProvider);
  return AuthRepositoryImpl(api);
});

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi _authApi;

  AuthRepositoryImpl(this._authApi);

  @override
  Future<Auth> getDevToken(String xDevLoginKey) async {
    final response = await _authApi.getDevLogin(xDevLoginKey);
    return _unwrap(response).toEntity();
  }

  @override
  Future<Auth> socialLogin(String channel, String idToken) async {
    final response = await _authApi.socialLogin(
      SocialLoginRequest(provider: channel, idToken: idToken),
    );
    return _unwrap(response).toEntity();
  }

  AuthModel _unwrap(ApiResponse<AuthModel> response) {
    final data = response.data;
    if (!response.success || data == null) {
      throw Exception(response.error ?? 'Unknown API error');
    }
    return data;
  }
}