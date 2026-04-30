import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../appRouter.dart';
import '../../../const.dart';

class SpalshScreenBody extends StatefulWidget {
  const SpalshScreenBody({super.key});

  @override
  State<SpalshScreenBody> createState() => _SpalshScreenBodyState();
}

class _SpalshScreenBodyState extends State<SpalshScreenBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 1.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
    );

    animationController.forward();

    Future.delayed(const Duration(seconds: 2), () async {
      if (!mounted) return;

      final prefs = await SharedPreferences.getInstance();
      final seenOnboarding = prefs.getBool('seenOnboarding') ?? false;

      if (!mounted) return;

      if (seenOnboarding) {
        GoRouter.of(context).go(AppRouter.routGetStartedScreen);
      } else {
        GoRouter.of(context).go(AppRouter.routOnboardingScreen);
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            backgroundImage,
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.05),
          ),
        ),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                logoImage,
                width: MediaQuery.of(context).size.width * 0.35,
              ),
              const SizedBox(height: 10),
              SlideTransition(
                position: slidingAnimation,
                child: Image.asset(nameImage,width: 210,),
              ),
              const SizedBox(height: 3),
              const Text(
                'Explore the Beauty of Syria',
                style: TextStyle(
                  color: KPrimarColor,
                  fontSize: 16,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}