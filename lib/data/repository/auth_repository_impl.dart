import 'package:ditto/data/api/auth_api.dart';
import 'package:ditto/data/model/social_login_request.dart';
import 'package:ditto/domain/entity/Auth/dev_login.dart';
import 'package:ditto/domain/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/api_response.dart';
import '../../domain/entity/Auth/social_login.dart';
import '../model/social_login_model.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final api = ref.watch(authApiProvider);
  return AuthRepositoryImpl(api);
});

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi _authApi;

  AuthRepositoryImpl(this._authApi);

  @override
  Future<DevLogin> getDevToken(String xDevLoginKey) async {
    final response = await _authApi.getDevLogin(xDevLoginKey);
    return response.unwrap().toEntity();
  }

  @override
  Future<SocialLogin> socialLogin(String channel, String idToken) async {
    final response = await _authApi.socialLogin(
      SocialLoginRequest(provider: channel, idToken: idToken),
    );
    return response.unwrap().toEntity();
  }

  /*SocialLoginModel _unwrap(ApiResponse<SocialLoginModel> response) {
    final data = response.data;
    if (!response.success || data == null) {
      throw Exception(response.error ?? 'Unknown API error');
    }
    return data;
  }*/
}