import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:tourismapp/Features/On-boarding-Screens/OnboardingScreen.dart';
import 'package:tourismapp/Features/On-boarding-Screens/ScreenTwo.dart';
import 'package:tourismapp/Features/SplashScreen/splash_screen.dart';
import 'package:tourismapp/Features/On-boarding-Screens/ScreenOne.dart';

import 'Features/GetStartedScreen/getStartedScreen.dart';
import 'MainScreen.dart';

class AppRouter {
  static const String routScreenOne = '/ScreenOne';
  static const String routScreenTwo = '/ScreenTwo';
  static const String routOnboardingScreen = '/OnboardingScreen';
  static const String routGetStartedScreen = '/GetStartedScreen';
  static const String routMainScreen='/MainScreen';



  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return SplashScreen();
        },
      ),
      GoRoute(
        path: routOnboardingScreen,
        builder: (BuildContext context, GoRouterState state) {
          return  OnboardingScreen();
        },
      ),
      GoRoute(
        path: routGetStartedScreen,
        builder: (BuildContext context, GoRouterState state) {
          return GetStartedScreen();
        },
      ),
      GoRoute(
        path: routMainScreen,
        builder: (BuildContext context, GoRouterState state) {
          return  MainScreen();
        },
      ),

    ],
  );
}
