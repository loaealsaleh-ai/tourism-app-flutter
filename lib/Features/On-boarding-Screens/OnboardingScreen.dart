import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourismapp/Features/On-boarding-Screens/ScreenOne.dart';
import 'package:tourismapp/Features/On-boarding-Screens/ScreenThree.dart';
import 'package:tourismapp/Features/On-boarding-Screens/ScreenTwo.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController =PageController();
  int currentIndex=0;
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
        onPageChanged: (index){
          setState(() {
            currentIndex=index;
          });
        },
        children: [
          ScreenOne(pageController: pageController,),
          ScreenTwo(pageController: pageController,),
          ScreenThree(),
        ],
      ),
    );
  }
}
