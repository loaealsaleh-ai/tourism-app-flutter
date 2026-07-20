import 'package:dio/dio.dart';

import '../constants/api_constants.dart';
import '../storage/token_storage_service.dart';

class ApiClient {
  final Dio dio;
  final TokenStorageService tokenStorageService;

  ApiClient(this.dio, this.tokenStorageService) {
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
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await tokenStorageService.getToken();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
      ),
    );

    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: false,
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

  Future<Response<dynamic>> get({required String endpoint}) async {
    return dio.get('/$endpoint');
  }

}

class ApiService extends ApiClient {
  ApiService(super.dio, super.tokenStorageService);
}
