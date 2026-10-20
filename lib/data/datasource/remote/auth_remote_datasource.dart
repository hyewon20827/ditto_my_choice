import 'package:ditto/core/network/dio_client.dart';
import 'package:ditto/data/model/auth_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRemoteDataSourceProvider =
Provider<AuthRemoteDatasource>((ref) {
  final client = ref.watch(dioClientProvider);

  return AuthRemoteDatasource(client);
});

class AuthRemoteDatasource {
  final DioClient client;

  AuthRemoteDatasource(this.client);

  Future<AuthModel> getDevToken() async {
    final response = await client.get<Map<String, dynamic>>(
      '/auth/dev-login'
    );

    return AuthModel.fromJson(response.data!, );
  }
}