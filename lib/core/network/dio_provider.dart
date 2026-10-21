import 'package:dio/dio.dart';
import 'package:ditto/core/network/auth_interceptor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../env.dart';
import '../storage/token_storage.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: Env.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  final tokenStorage = ref.watch(tokenStorageProvider);

  dio.interceptors.add(AuthInterceptor((tokenStorage)));
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        print('[API REQUEST] ${options.method} ${options.uri}');
        handler.next(options);
      },
      onResponse: (response, handler) {
        print('[API RESPONSE] ${response.statusCode}');
        print('[API RESPONSE] ${response.data}');
        handler.next(response);
      },
      onError: (error, handler) {
        print('[API ERROR] ${error.requestOptions.method} '
            '${error.requestOptions.uri}');
        print('[API STATUS] ${error.response?.statusCode}');
        print('[API BODY] ${error.response?.data}');
        handler.next(error);
      },
    ),
  );

  return dio;
});