import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourismapp/Features/auth/presentation/widgets/auth_header_icon.dart';
import 'package:tourismapp/Features/auth/presentation/widgets/primary_auth_button.dart';
import 'package:tourismapp/app/router/app_router.dart';
import 'package:tourismapp/core/constants/app_constants.dart';


class AuthSuccessScreen extends StatelessWidget {
  const AuthSuccessScreen({super.key, required this.subtitle});

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),

              AuthHeaderIcon(variant: AuthIconVariant.shieldCheck),
              const SizedBox(height: 36),

              Text(
                'Success!',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                  fontFamily: 'Playfair Display',
                ),
              ),
              const SizedBox(height: 14),

              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                  height: 1.6,
                ),
              ),

              const Spacer(),

              PrimaryAuthButton(
                label: 'Continue',
                onTap: () => context.go(AppRouter.login),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
