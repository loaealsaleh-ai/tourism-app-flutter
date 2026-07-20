import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourismapp/app/router/app_router.dart';
import 'package:tourismapp/core/network/api_client.dart';
import 'package:tourismapp/core/storage/token_storage_service.dart';
import 'package:tourismapp/core/storage/onboarding_storage_service.dart';
import 'package:tourismapp/Features/auth/data/repositories/auth_repository.dart';
import 'package:tourismapp/Features/auth/data/services/auth_api_service.dart';
import 'package:tourismapp/Features/auth/presentation/view_models/auth_view_model.dart';

class TourismApp extends StatelessWidget {
  const TourismApp({super.key});

  @override
  Widget build(BuildContext context) {
    final tokenStorageService = TokenStorageService();
    final onboardingStorageService = OnboardingStorageService();
    final apiClient = ApiClient(Dio(), tokenStorageService);
    final authRepository = AuthRepository(AuthApiService(apiClient));
    final authViewModel = AuthViewModel(
      repository: authRepository,
      tokenStorageService: tokenStorageService,
    );

    return BlocProvider<AuthViewModel>(
      create: (_) => authViewModel,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter(
          authViewModel: authViewModel,
          tokenStorageService: tokenStorageService,
          onboardingStorageService: onboardingStorageService,
        ).router,
      ),
    );
  }
}
