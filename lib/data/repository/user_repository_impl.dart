import 'package:ditto/data/api/auth_api.dart';
import 'package:ditto/data/api/user_api.dart';
import 'package:ditto/data/datasource/remote/auth_remote_datasource.dart';
import 'package:ditto/data/model/social_login_request.dart';
import 'package:ditto/domain/entity/Auth/user.dart';
import 'package:ditto/domain/repository/auth_repository.dart';
import 'package:ditto/domain/repository/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entity/Auth/auth.dart';

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
    final model = await _userApi.getUserInfo(idToken: idToken);

    return model.toEntity();
  }


}