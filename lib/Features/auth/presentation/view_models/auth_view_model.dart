import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourismapp/core/storage/token_storage_service.dart';
import 'package:tourismapp/Features/auth/data/repositories/auth_repository.dart';

import 'auth_state.dart';

class AuthViewModel extends Cubit<AuthState> {
  final AuthRepository repository;
  final TokenStorageService tokenStorageService;

  AuthViewModel({
    required this.repository,
    required this.tokenStorageService,
  }) : super(AuthInitial());

  Future<void> register({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    if (password != confirmPassword) {
      emit(AuthError('Passwords do not match'));
      return;
    }

    emit(AuthLoading());

    try {
      final message = await repository.register(
        username: username,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      );

      emit(RegisterSuccess(message: message, email: email));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());

    try {
      final response = await repository.login(email: email, password: password);
      await tokenStorageService.saveToken(response.token);

      emit(LoginSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> forgotPassword({required String email}) async {
    emit(AuthLoading());

    try {
      final message = await repository.forgotPassword(email: email);
      emit(ForgotPasswordSuccess(message: message, email: email));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> verifyOtp({
    required String email,
    required String otp,
  }) async {
    emit(AuthLoading());

    try {
      final message = await repository.verifyOtp(email: email, otp: otp);
      emit(VerifyOtpSuccess(message: message, email: email, otp: otp));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> resendOtp({required String email}) async {
    emit(AuthLoading());

    try {
      final message = await repository.resendOtp(email: email);
      emit(AuthSuccess(message));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> resetPassword({
    required String email,
    required String otp,
    required String password,
  }) async {
    emit(AuthLoading());

    try {
      final message = await repository.resetPassword(
        email: email,
        otp: otp,
        password: password,
      );
      emit(ResetPasswordSuccess(message));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> logout() async {
    emit(AuthLoading());

    try {
      await repository.logout();
      await tokenStorageService.clearToken();

      emit(LogoutSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
