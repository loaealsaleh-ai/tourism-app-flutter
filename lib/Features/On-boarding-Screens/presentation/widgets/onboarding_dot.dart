import 'package:flutter/material.dart';
import 'package:tourismapp/core/constants/app_constants.dart';

class OnboardingDot extends StatelessWidget {
  const OnboardingDot({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 20 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? kPrimaryColor : Colors.black26,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
