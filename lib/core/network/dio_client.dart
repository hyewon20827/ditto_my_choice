import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dio_provider.dart';

final dioClientProvider = Provider<DioClient>((ref) {
  final dio = ref.watch(dioProvider);

  return DioClient(dio);
});

class DioClient {
  final Dio dio;

  DioClient(this.dio);

  Future<Response<T>> get<T>(
      String path, {
        Map<String, dynamic>? queryParameters,
      }) {
    return dio.get<T>(
      path,
      queryParameters: queryParameters,
    );
  }

  Future<Response<T>> post<T>(
      String path, {
        dynamic data,
      }) {
    return dio.post<T>(
      path,
      data: data,
    );
  }
}