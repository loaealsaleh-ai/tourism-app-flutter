import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:tourismapp/features/SplashScreen/splash_screen.dart';
import 'package:tourismapp/features/On-boarding-Screens/OnboardingScreen.dart';
import 'package:tourismapp/features/GetStartedScreen/getStartedScreen.dart';
import 'package:tourismapp/features/Accounts/LoginScreen.dart';
import 'package:tourismapp/features/Accounts/ForgotPasswordScreen.dart';
import 'package:tourismapp/features/auth/presentation/cubit/auth_cubit.dart';
import 'features/Accounts/RegisterScreen.dart';
import 'features/Accounts/ResetPasswordScreen.dart';
import 'features/Accounts/VerificationCodeScreen.dart';

class AppRouter {
  static const String routOnboardingScreen = '/OnboardingScreen';
  static const String routGetStartedScreen = '/GetStartedScreen';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgotPassword';
  static const String resetPassword = '/resetPassword';
  static const String verifyCode = '/verifyCode';

  final AuthCubit authCubit;

  AppRouter(this.authCubit);

  late final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashScreen()),

      GoRoute(
        path: routOnboardingScreen,
        builder: (context, state) => OnboardingScreen(),
      ),

      GoRoute(
        path: routGetStartedScreen,
        builder: (context, state) => GetStartedScreen(),
      ),

      GoRoute(path: login, builder: (context, state) => LoginScreen()),

      GoRoute(path: register, builder: (context, state) => RegisterScreen()),

      GoRoute(
        path: forgotPassword,
        builder: (context, state) => ForgotPasswordScreen(),
      ),
      GoRoute(
        path: verifyCode,
        builder: (context, state) => VerificationCodeScreen(),
      ),
      GoRoute(
        path: resetPassword,
        builder: (context, state) => ResetPasswordScreen(),
      ),
    ],
  );
}
