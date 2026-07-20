import 'package:dio/dio.dart';
import 'package:tourismapp/core/network/api_client.dart';

class AuthApiService {
  final ApiClient apiClient;

  AuthApiService(this.apiClient);

  Future<Response<dynamic>> register({
    required String username,
    required String email,
    required String password,
  }) {
    return apiClient.post(
      endpoint: 'auth/register',
      data: {
        'username': username,
        'email': email,
        'password': password,
      },
    );
  }

  Future<Response<dynamic>> login({
    required String login,
    required String password,
  }) {
    return apiClient.post(
      endpoint: 'auth/login',
      data: {'login': login, 'password': password},
    );
  }

  Future<Response<dynamic>> logout() {
    return apiClient.post(
      endpoint: 'auth/logout',
      data: {},
    );
  }

  Future<Response<dynamic>> forgotPassword({required String email}) {
    return apiClient.post(
      endpoint: 'auth/forgot-password',
      data: {'email': email},
    );
  }

  Future<Response<dynamic>> verifyOtp({
    required String email,
    required String otp,
  }) {
    return apiClient.post(
      endpoint: 'auth/verify-otp',
      data: {'email': email, 'otp': otp},
    );
  }

  Future<Response<dynamic>> resendOtp({required String email}) {
    return apiClient.post(
      endpoint: 'auth/resend-otp',
      data: {'email': email},
    );
  }

  Future<Response<dynamic>> resetPassword({
    required String email,
    required String otp,
    required String password,
  }) {
    return apiClient.post(
      endpoint: 'auth/reset-password',
      data: {'email': email, 'otp': otp, 'password': password},
    );
  }
}
