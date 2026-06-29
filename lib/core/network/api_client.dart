import 'package:dio/dio.dart';

import '../constants/api_constants.dart';

class ApiClient {
  final Dio dio;

  ApiClient(this.dio) {
    dio.options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 20),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        error: true,
      ),
    );
  }

  Future<Response<dynamic>> post({
    required String endpoint,
    required Map<String, dynamic> data,
  }) async {
    return dio.post('/$endpoint', data: data);
  }
}

class ApiService extends ApiClient {
  ApiService(super.dio);
}
