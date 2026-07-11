import 'package:flutter/material.dart';
import 'screen_one_view.dart';
import 'screen_three_view.dart';
import 'screen_two_view.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController pageController = PageController();
  int currentIndex = 0;
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: [
          ScreenOneView(pageController: pageController),
          ScreenTwoView(pageController: pageController),
          ScreenThreeView(),
        ],
      ),
    );
  }
}
