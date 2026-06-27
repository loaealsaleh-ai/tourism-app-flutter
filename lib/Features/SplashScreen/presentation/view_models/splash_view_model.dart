import 'package:tourismapp/appRouter.dart';
import 'package:tourismapp/core/storage/onboarding_storage_service.dart';

class SplashViewModel {
  final OnboardingStorageService onboardingStorageService;

  SplashViewModel(this.onboardingStorageService);

  Future<String> getNextRoute() async {
    final seenOnboarding = await onboardingStorageService.hasSeenOnboarding();
    return seenOnboarding
        ? AppRouter.routMainScreen
        : AppRouter.routOnboardingScreen;
  }
}
