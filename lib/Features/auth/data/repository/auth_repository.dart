import 'package:dio/dio.dart';
import '../datasource/api_service.dart';
import '../models/login_response_model.dart';

class AuthRepository {
  final ApiService apiService;

  AuthRepository(this.apiService);

  Future<String> register({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final response = await apiService.post(
        endpoint: "register",
        data: {
          "username": username,
          "email": email,
          "password": password,
          "password_confirmation": confirmPassword,
        },
      );

      return response.data['message'];
    } on DioException catch (e) {
      if (e.response != null) {
        return e.response!.data['message'];
      }
      throw Exception("Network error");
    }
  }

  Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiService.post(
        endpoint: "login",
        data: {"login": email, "password": password},
      );

      return LoginResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(e.response!.data['message']);
      }
      throw Exception("Network error");
    }
  }
}
