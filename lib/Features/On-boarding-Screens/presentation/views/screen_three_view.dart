import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourismapp/app/router/app_router.dart';
import 'package:tourismapp/const.dart';
import 'package:tourismapp/core/storage/onboarding_storage_service.dart';
import 'package:tourismapp/Features/On-boarding-Screens/presentation/view_models/onboarding_view_model.dart';
import '../widgets/onboarding_dot.dart';

class ScreenThreeView extends StatelessWidget {
  const ScreenThreeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(onboardingImageThree, fit: BoxFit.cover),
        ),

        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Start with Shamora',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Sign in to book, save favorites, and unlock the full travel experience.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OnboardingDot(isActive: false),
                    OnboardingDot(isActive: false),
                    OnboardingDot(isActive: true),
                  ],
                ),
                SizedBox(height: 30),
                InkWell(
                  onTap: () async {
                    final viewModel = OnboardingViewModel(
                      OnboardingStorageService(),
                    );
                    await viewModel.completeOnboarding();

                    if (!context.mounted) return;

                    GoRouter.of(context).go(AppRouter.routMainScreen);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 55,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    /*Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF0F4D4A),
            Color(0xFF0F4D4A),
            Color(0xFF1A706B),
            Color(0xFF22A699),
            Color(0xFF7ED3C2),
            Color(0xFFBFE8D9),
            Color(0xFFF5FAF7),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'Skip',
                    style: TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Spacer(),
              Image.asset(onboardingImageThree,height: 260,),
              SizedBox(height: 30,),
              Text(
                'Start with Shamora',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Sign in to book, save favorites, and unlock the full travel experience.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OnboardingDot(isActive: false,),
                  OnboardingDot(isActive: false,),
                  OnboardingDot(isActive: true,),
                ],
              ),
              SizedBox(height: 30),
              InkWell(
                onTap: () {
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  child: Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      color:kPrimaryColor ,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );*/
  }
}
