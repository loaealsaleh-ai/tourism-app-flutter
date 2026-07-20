abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String message;

  AuthSuccess(this.message);
}

class LoginSuccess extends AuthState {}

class ForgotPasswordSuccess extends AuthState {
  final String message;
  final String email;

  ForgotPasswordSuccess({required this.message, required this.email});
}

class VerifyOtpSuccess extends AuthState {
  final String message;
  final String email;
  final String otp;

  VerifyOtpSuccess({
    required this.message,
    required this.email,
    required this.otp,
  });
}

class ResetPasswordSuccess extends AuthState {
  final String message;

  ResetPasswordSuccess(this.message);
}

class RegisterSuccess extends AuthState {
  final String message;
  final String email;

  RegisterSuccess({required this.message, required this.email});
}

class LogoutSuccess extends AuthState {}

class AuthError extends AuthState {
  final String error;

  AuthError(this.error);
}
