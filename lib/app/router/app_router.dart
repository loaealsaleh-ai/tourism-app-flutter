import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourismapp/Features/Hotels/presentation/views/hotel_view.dart';
import 'package:tourismapp/Features/Hotels/presentation/views/success_screen.dart';
import 'package:tourismapp/Features/On-boarding-Screens/presentation/views/onboarding_view.dart';
import 'package:tourismapp/Features/SplashScreen/presentation/views/splash_view.dart';
import 'package:tourismapp/Features/auth/presentation/views/forgot_password_view.dart';
import 'package:tourismapp/Features/auth/presentation/views/login_view.dart';
import 'package:tourismapp/Features/auth/presentation/views/register_view.dart';
import 'package:tourismapp/Features/auth/presentation/views/reset_password_view.dart';
import 'package:tourismapp/Features/auth/presentation/views/verification_code_view.dart';
import 'package:tourismapp/Features/auth/presentation/view_models/auth_view_model.dart';
import 'package:tourismapp/Features/main/presentation/views/main_view.dart';

import '../../Features/Hotels/presentation/views/booking_screen.dart';
import '../../Features/Hotels/presentation/views/room_details_screen.dart';

class AppRouter {
  static const String routOnboardingScreen = '/OnboardingScreen';
  static const String routMainScreen = '/MainScreen';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgotPassword';
  static const String resetPassword = '/resetPassword';
  static const String verifyCode = '/verifyCode';
  static const String routHotelsScreen = '/HotelsScreen';
  static const String routRoomDetails='/RoomDetailsScreen';
  static const String routBookingScreen='/BookingScreen';
  static const String routSuccessScreen='/SuccessScreen';

  final AuthViewModel authViewModel;

  AppRouter(this.authViewModel);

  late final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return SplashView();
            //RoomDetailsScreen();
        },
      ),
      GoRoute(
        path: routOnboardingScreen,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: routMainScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const MainView();
        },
      ),
      GoRoute(path: login, builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: register,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: forgotPassword,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: verifyCode,
        builder: (context, state) {
          final email = state.uri.queryParameters['email'] ?? '';
          return VerificationCodeScreen(email: email);
        },
      ),
      GoRoute(
        path: resetPassword,
        builder: (context, state) {
          final email = state.uri.queryParameters['email'] ?? '';
          final otp = state.uri.queryParameters['otp'] ?? '';
          return ResetPasswordScreen(email: email, otp: otp);
        },
      ),
      GoRoute(
        path: routHotelsScreen,
        builder: (context, state) => const HotelsView(),
      ),
      GoRoute(
        path: routRoomDetails,
        builder: (context, state) => const RoomDetailsScreen(),
      ),
      GoRoute(
        path: routBookingScreen,
        builder: (context, state) => const BookingScreen(),
      ),
      GoRoute(
        path: routSuccessScreen,
        builder: (context, state) => const SuccessScreen(),
      ),
    ],
  );
}
