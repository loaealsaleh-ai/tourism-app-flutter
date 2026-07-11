import 'package:dio/dio.dart';
import 'package:tourismapp/core/network/api_client.dart';

class AuthApiService {
  final ApiClient apiClient;

  AuthApiService(this.apiClient);

  Future<Response<dynamic>> register({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    return apiClient.post(
      endpoint: 'register',
      data: {
        'username': username,
        'email': email,
        'password': password,
        'password_confirmation': confirmPassword,
      },
    );
  }

  Future<Response<dynamic>> login({
    required String email,
    required String password,
  }) {
    return apiClient.post(
      endpoint: 'login',
      data: {'login': email, 'password': password},
    );
  }

  Future<Response<dynamic>> forgotPassword({required String email}) {
    return apiClient.post(
      endpoint: 'forgot-password',
      data: {'email': email},
    );
  }

  Future<Response<dynamic>> verifyOtp({
    required String email,
    required String otp,
  }) {
    return apiClient.post(
      endpoint: 'verify-otp',
      data: {'email': email, 'otp': otp},
    );
  }

  Future<Response<dynamic>> resendOtp({required String email}) {
    return apiClient.post(
      endpoint: 'resend-otp',
      data: {'email': email},
    );
  }

  Future<Response<dynamic>> resetPassword({
    required String email,
    required String otp,
    required String password,
  }) {
    return apiClient.post(
      endpoint: 'reset-password',
      data: {'email': email, 'otp': otp, 'password': password},
    );
  }
}
