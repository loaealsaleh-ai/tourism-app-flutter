import 'package:dio/dio.dart';

import '../models/login_response_model.dart';
import '../services/auth_api_service.dart';

class AuthRepository {
  final AuthApiService authApiService;

  AuthRepository(this.authApiService);

  Future<String> register({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final response = await authApiService.register(
        username: username,
        email: email,
        password: password,
      );

      return response.data['message'];
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(e.response!.data['message']);
      }
      throw Exception('Network error');
    }
  }

  Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await authApiService.login(
        login: email,
        password: password,
      );

      return LoginResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(e.response!.data['message']);
      }
      throw Exception('Network error');
    }
  }

  Future<String> forgotPassword({required String email}) async {
    try {
      final response = await authApiService.forgotPassword(email: email);
      return response.data['message'];
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(e.response!.data['message']);
      }
      throw Exception('Network error');
    }
  }

  Future<String> verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await authApiService.verifyOtp(email: email, otp: otp);
      return response.data['message'];
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(e.response!.data['message']);
      }
      throw Exception('Network error');
    }
  }

  Future<String> resendOtp({required String email}) async {
    try {
      final response = await authApiService.resendOtp(email: email);
      return response.data['message'];
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(e.response!.data['message']);
      }
      throw Exception('Network error');
    }
  }

  Future<String> resetPassword({
    required String email,
    required String otp,
    required String password,
  }) async {
    try {
      final response = await authApiService.resetPassword(
        email: email,
        otp: otp,
        password: password,
      );
      return response.data['message'];
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(e.response!.data['message']);
      }
      throw Exception('Network error');
    }
  }

  Future<String> logout() async {
    try {
      final response = await authApiService.logout();
      return response.data['message'];
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(e.response!.data['message']);
      }
      throw Exception('Network error');
    }
  }
}
