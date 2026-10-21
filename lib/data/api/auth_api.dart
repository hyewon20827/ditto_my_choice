import 'package:dio/dio.dart';
import 'package:ditto/core/network/api_response.dart';
import 'package:ditto/data/model/dev_auth_model.dart';
import 'package:ditto/data/model/social_login_model.dart';
import 'package:ditto/data/model/social_login_request.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/network/dio_provider.dart';

part 'auth_api.g.dart';

final authApiProvider = Provider<AuthApi>((ref) {
  final dio = ref.watch(dioProvider);
  return AuthApi(dio);
});

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio) = _AuthApi;

  @POST('/auth/dev-login')
  Future<ApiResponse<DevAuthModel>> getDevLogin(@Header('X-Dev-Login-Key') String xDevLoginKey);

  @POST('/auth/social')
  Future<ApiResponse<SocialLoginModel>> socialLogin(@Body() SocialLoginRequest request);

  @POST('/auth/refresh')
  @FormUrlEncoded()
  Future<ApiResponse<SocialLoginModel>> refreshToken(@Field('refreshToken') String refreshToken);
}