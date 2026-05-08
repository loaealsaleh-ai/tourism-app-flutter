import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourismapp/features/auth/data/repository/auth_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repository;

  AuthCubit(this.repository) : super(AuthInitial());

  Future<void> register({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(AuthLoading());

    try {
      final message = await repository.register(
        username: username,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      );

      emit(AuthSuccess(message));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());

    try {
      await repository.login(email: email, password: password);

      emit(LoginSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
