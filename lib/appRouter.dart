import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:tourismapp/Features/On-boarding-Screens/OnboardingScreen.dart';
import 'package:tourismapp/Features/On-boarding-Screens/ScreenTwo.dart';
import 'package:tourismapp/Features/SplashScreen/splash_screen.dart';
import 'package:tourismapp/Features/On-boarding-Screens/ScreenOne.dart';

class AppRouter {
  static const String routScreenOne = '/ScreenOne';
  static const String routScreenTwo = '/ScreenTwo';
  static const String routOnboardingScreen = '/OnboardingScreen';


  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return  SplashScreen();
        },
      ),
      GoRoute(
        path: routOnboardingScreen,
        builder: (BuildContext context, GoRouterState state) {
          return  OnboardingScreen();
        },
      ),

    ],
  );
}