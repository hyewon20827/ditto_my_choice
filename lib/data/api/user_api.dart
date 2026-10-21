import 'package:dio/dio.dart';
import 'package:ditto/core/network/api_response.dart';
import 'package:ditto/data/model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/network/dio_provider.dart';

part 'user_api.g.dart';

final userApiProvider = Provider<UserApi>((ref) {
  final dio = ref.watch(dioProvider);
  return UserApi(dio);
});

@RestApi()
abstract class UserApi {
  factory UserApi(Dio dio) = _UserApi;

  @GET('/users/me')
  Future<ApiResponse<UserModel>> getUserInfo({required String idToken});
}