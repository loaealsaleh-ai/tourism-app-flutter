import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourismapp/appRouter.dart';
import 'package:tourismapp/const.dart';

class SpalshScreenBody extends StatefulWidget {
  const SpalshScreenBody({super.key});

  @override
  State<SpalshScreenBody> createState() => _SpalshScreenBodyState();
}

class _SpalshScreenBodyState extends State<SpalshScreenBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  bool showText = false;
  late Animation<Offset> textAnimation;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    animationController.forward();

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (!mounted) return;
        setState(() {
          showText = true;
        });
      }
    });

    textAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
    );

    fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn,
      ),
    );

    Future.delayed(const Duration(seconds: 5), () async {
      if (!mounted) return;

      final prefs = await SharedPreferences.getInstance();
      final seenOnboarding = prefs.getBool('seenOnboarding') ?? false;

      if (!mounted) return;

      if (seenOnboarding) {
         GoRouter.of(context).go(AppRouter.routMainScreen);
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
              AnimatedBuilder(
                animation: animationController,
                builder: (context, child) {
                  return ShaderMask(
                    shaderCallback: (bounds) {
                      return LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [
                          (animationController.value - 0.2).clamp(0.0, 1.0),
                          animationController.value.clamp(0.0, 1.0),
                        ],
                        colors: const [
                          Colors.white,
                          Colors.transparent,
                        ],
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.dstIn,
                    child: Image.asset(
                      logoImage,
                      width: MediaQuery.of(context).size.width * 0.50,
                    ),
                  );
                },
              ),

              const SizedBox(height: 8),

              FadeTransition(
                opacity: fadeAnimation,
                child: SlideTransition(
                  position: textAnimation,
                  child: const Text(
                    'Explore the Beauty of Syria',
                    style: TextStyle(
                      color: KPrimarColor,
                      fontSize: 16,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}