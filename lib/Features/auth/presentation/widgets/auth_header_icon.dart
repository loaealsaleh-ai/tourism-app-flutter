import 'package:flutter/material.dart';
import 'package:tourismapp/core/constants/app_constants.dart';

enum AuthIconVariant { shieldLock, shieldStars, shieldCheck }

/// Renders the header icon for Auth screens.
/// Supports three variants matching the design screenshots:
///  - [shieldLock]   → Forgot Password screen
///  - [shieldStars]  → Create New Password screen
///  - [shieldCheck]  → Success screen (inside a circular ring)
class AuthHeaderIcon extends StatelessWidget {
  const AuthHeaderIcon({super.key, required this.variant});

  final AuthIconVariant variant;

  @override
  Widget build(BuildContext context) {
    if (variant == AuthIconVariant.shieldCheck) {
      return _SuccessRing();
    }
    return _ShieldIcon(variant: variant);
  }
}

class _ShieldIcon extends StatelessWidget {
  const _ShieldIcon({required this.variant});
  final AuthIconVariant variant;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 110,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            variant == AuthIconVariant.shieldLock
                ? Icons.lock_rounded
                : Icons.lock_reset_rounded,
            color: Colors.white,
            size: 38,
          ),
          if (variant == AuthIconVariant.shieldStars) ...[
            const SizedBox(height: 6),
            const Text(
              '* * * * *',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 13,
                letterSpacing: 4,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _SuccessRing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 130,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFFB0C4C2),
          width: 10,
        ),
        color: Colors.white,
      ),
      child: Center(
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(
            Icons.check_rounded,
            color: Colors.white,
            size: 42,
          ),
        ),
      ),
    );
  }
}
