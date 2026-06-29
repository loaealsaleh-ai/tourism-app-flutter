import 'package:tourismapp/core/storage/onboarding_storage_service.dart';

class OnboardingViewModel {
  final OnboardingStorageService onboardingStorageService;

  OnboardingViewModel(this.onboardingStorageService);

  Future<void> completeOnboarding() {
    return onboardingStorageService.markOnboardingSeen();
  }
}
