import 'package:ditto/core/network/api_response.dart';
import 'package:ditto/data/api/user_api.dart';
import 'package:ditto/domain/entity/Auth/user.dart';
import 'package:ditto/domain/repository/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final api = ref.watch(userApiProvider);
  return UserRepositoryImpl(api);
});

class UserRepositoryImpl implements UserRepository{
  // final AuthRemoteDatasource authRemoteDatasource;

  final UserApi _userApi;

  UserRepositoryImpl(this._userApi);

  @override
  Future<User> getUserInfo(String idToken) async {
    final response = await _userApi.getUserInfo(idToken: idToken);

    return response.unwrap().toEntity();
  }


}