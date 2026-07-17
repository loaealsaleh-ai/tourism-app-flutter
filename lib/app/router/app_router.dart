import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:tourismapp/Features/Explore/presentation/views/comments_screen.dart';
import 'package:tourismapp/Features/Explore/presentation/views/explore_screen.dart';
import 'package:tourismapp/Features/Explore/presentation/views/place_details_screen.dart';
import 'package:tourismapp/Features/Explore/presentation/widgets/detailsScreen/commet_card.dart';

import 'package:tourismapp/Features/Hotels/presentation/views/hotel_view.dart';
import 'package:tourismapp/Features/Hotels/presentation/views/success_screen.dart';
import 'package:tourismapp/Features/Hotels/presentation/views/booking_screen.dart';
import 'package:tourismapp/Features/Hotels/presentation/views/room_details_screen.dart';

import 'package:tourismapp/Features/On-boarding-Screens/presentation/views/onboarding_view.dart';
import 'package:tourismapp/Features/SevricesScreen/presentation/views/services_screen.dart';
import 'package:tourismapp/Features/SplashScreen/presentation/views/splash_view.dart';

import 'package:tourismapp/Features/auth/presentation/views/forgot_password_view.dart';
import 'package:tourismapp/Features/auth/presentation/views/login_view.dart';
import 'package:tourismapp/Features/auth/presentation/views/register_view.dart';
import 'package:tourismapp/Features/auth/presentation/views/reset_password_view.dart';
import 'package:tourismapp/Features/auth/presentation/views/verification_code_view.dart';
import 'package:tourismapp/Features/auth/presentation/view_models/auth_view_model.dart';

import 'package:tourismapp/Features/main/presentation/views/main_view.dart';

// Restaurant imports (your additions)
import 'package:tourismapp/Features/Restaurants/presentation/views/table_booking_screen.dart';
import 'package:tourismapp/Features/Restaurants/presentation/views/restaurant_view.dart';
import 'package:tourismapp/Features/Restaurants/presentation/views/restaurant_details_screen.dart';

import '../../Features/SevricesScreen/data/services/translation_service.dart';
import '../../Features/SevricesScreen/presentation/view_models/translation_cubit.dart';
import '../../Features/SevricesScreen/presentation/views/translation_screen.dart';

class AppRouter {
  static const String routOnboardingScreen = '/OnboardingScreen';
  static const String routMainScreen = '/MainScreen';

  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgotPassword';
  static const String resetPassword = '/resetPassword';
  static const String verifyCode = '/verifyCode';

  static const String routHotelsScreen = '/HotelsScreen';
  static const String routRoomDetails = '/RoomDetailsScreen';
  static const String routBookingScreen = '/BookingScreen';
  static const String routSuccessScreen = '/SuccessScreen';

  static const String routExploreScreen = '/ExploreScreen';
  static const String routPlaceDetailsScreen = '/PlaceDetailsScreen';
  static const String routCommentsScreen = '/CommentsScreen';

  // Restaurant routes (your additions)
  static const String routRestaurantScreen = '/RestaurantScreen';
  static const String routRestaurantDetails = '/RestaurantDetailsScreen';
  static const String routTableBookingScreen = '/TableBookingScreen';

  // services
  static const String routServicesScreen = '/ServicesScreen';
  static const String routTranslationScreen = '/TranslationScreen';

  final AuthViewModel authViewModel;

  AppRouter(this.authViewModel);

  late final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return MainView();
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

      // Restaurants (your feature)
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
      GoRoute(
        path: routServicesScreen,
        builder: (context, state) => ServicesScreen(),
      ),
      GoRoute(
        path: AppRouter.routTranslationScreen,
        builder: (context, state) {
          return BlocProvider(
            create: (_) => TranslationCubit(TranslationService()),
            child: const TranslationScreen(),
          );
        },
      ),
    ],
  );
}
