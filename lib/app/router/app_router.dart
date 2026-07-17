import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourismapp/core/storage/token_storage_service.dart';
import 'package:tourismapp/core/storage/onboarding_storage_service.dart';

import 'package:tourismapp/Features/Explore/presentation/views/comments_screen.dart';
import 'package:tourismapp/Features/Explore/presentation/views/explore_screen.dart';
import 'package:tourismapp/Features/Explore/presentation/views/place_details_screen.dart';

import 'package:tourismapp/Features/Hotels/presentation/views/hotel_view.dart';
import 'package:tourismapp/Features/Hotels/presentation/views/success_screen.dart';
import 'package:tourismapp/Features/Hotels/presentation/views/booking_screen.dart';
import 'package:tourismapp/Features/Hotels/presentation/views/room_details_screen.dart';

import 'package:tourismapp/Features/On-boarding-Screens/presentation/views/onboarding_view.dart';
import 'package:tourismapp/Features/SplashScreen/presentation/views/splash_view.dart';

import 'package:tourismapp/Features/auth/presentation/views/forgot_password_view.dart';
import 'package:tourismapp/Features/auth/presentation/views/login_view.dart';
import 'package:tourismapp/Features/auth/presentation/views/register_view.dart';
import 'package:tourismapp/Features/auth/presentation/views/reset_password_view.dart';
import 'package:tourismapp/Features/auth/presentation/views/auth_success_screen.dart';
import 'package:tourismapp/Features/auth/presentation/views/verification_code_view.dart';
import 'package:tourismapp/Features/auth/presentation/view_models/auth_view_model.dart';

import 'package:tourismapp/Features/main/presentation/views/main_view.dart';

import 'package:tourismapp/Features/Restaurants/presentation/views/table_booking_screen.dart';
import 'package:tourismapp/Features/Restaurants/presentation/views/restaurant_view.dart';
import 'package:tourismapp/Features/Restaurants/presentation/views/restaurant_details_screen.dart';

class AppRouter {
  static const String routOnboardingScreen = '/OnboardingScreen';
  static const String routMainScreen = '/MainScreen';

  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgotPassword';
  static const String resetPassword = '/resetPassword';
  static const String authSuccess = '/authSuccess';
  static const String verifyCode = '/verifyCode';

  static const String routHotelsScreen = '/HotelsScreen';
  static const String routRoomDetails = '/RoomDetailsScreen';
  static const String routBookingScreen = '/BookingScreen';
  static const String routSuccessScreen = '/SuccessScreen';

  static const String routExploreScreen = '/ExploreScreen';
  static const String routPlaceDetailsScreen = '/PlaceDetailsScreen';
  static const String routCommentsScreen = '/CommentsScreen';

  static const String routRestaurantScreen = '/RestaurantScreen';
  static const String routRestaurantDetails = '/RestaurantDetailsScreen';
  static const String routTableBookingScreen = '/TableBookingScreen';

  final AuthViewModel authViewModel;
  final TokenStorageService tokenStorageService;
  final OnboardingStorageService onboardingStorageService;

  AppRouter({
    required this.authViewModel,
    required this.tokenStorageService,
    required this.onboardingStorageService,
  });

  late final GoRouter router = GoRouter(
    initialLocation: '/',
    redirect: (BuildContext context, GoRouterState state) async {
      final hasSeenOnboarding = await onboardingStorageService
          .hasSeenOnboarding();
      final token = await tokenStorageService.getToken();
      final isLoggedIn = token != null && token.isNotEmpty;

      final isGoingToOnboarding = state.matchedLocation == routOnboardingScreen;
      final isGoingToAuthFlow =
          state.matchedLocation == login ||
          state.matchedLocation == register ||
          state.matchedLocation == verifyCode ||
          state.matchedLocation == forgotPassword ||
          state.matchedLocation == resetPassword ||
          state.matchedLocation == authSuccess;

      final isAtSplash = state.matchedLocation == '/';

      if (!hasSeenOnboarding) {
        if (!isGoingToOnboarding) return routOnboardingScreen;
        return null;
      }

      if (!isLoggedIn) {
        if (!isGoingToAuthFlow) return login;
        return null;
      }

      if (isLoggedIn &&
          (isGoingToAuthFlow || isGoingToOnboarding || isAtSplash)) {
        return routMainScreen;
      }

      return null;
    },
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),

      GoRoute(
        path: routOnboardingScreen,
        builder: (context, state) => const OnboardingView(),
      ),

      GoRoute(
        path: routMainScreen,
        builder: (context, state) => const MainView(),
      ),

      // Authentication
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
          final isPasswordReset =
              state.uri.queryParameters['isPasswordReset'] == 'true';
          return VerificationCodeScreen(
            email: email,
            isPasswordReset: isPasswordReset,
          );
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
        path: authSuccess,
        builder: (context, state) {
          final subtitle = Uri.decodeComponent(
            state.uri.queryParameters['subtitle'] ??
                'Operation completed successfully.',
          );
          return AuthSuccessScreen(subtitle: subtitle);
        },
      ),

      // Hotels
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

      // Explore
      GoRoute(
        path: routExploreScreen,
        builder: (context, state) => const ExploreScreen(),
      ),

      GoRoute(
        path: routPlaceDetailsScreen,
        builder: (context, state) => const PlaceDetailsScreen(),
      ),

      GoRoute(
        path: routCommentsScreen,
        builder: (context, state) => const CommentsScreen(),
      ),

      // Restaurants
      GoRoute(
        path: routRestaurantScreen,
        builder: (context, state) => const RestaurantView(),
      ),

      GoRoute(
        path: routRestaurantDetails,
        builder: (context, state) => const RestaurantDetailsScreen(),
      ),

      GoRoute(
        path: routTableBookingScreen,
        builder: (context, state) => const TableBookingScreen(),
      ),
    ],
  );
}
