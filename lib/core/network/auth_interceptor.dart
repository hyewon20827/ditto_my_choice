import 'package:dio/dio.dart';

import '../storage/token_storage.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor(this.tokenStorage);

  final TokenStorage tokenStorage;

  @override
  Future<void> onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    try {
      final token = await tokenStorage.getAccessToken();

      options.contentType = 'application/json';

      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }

      handler.next(options);
    } catch (error, stackTrace) {
      handler.reject(
        DioException(
          requestOptions: options,
          error: error,
          stackTrace: stackTrace,
        ),
      );
    }
  }
}
