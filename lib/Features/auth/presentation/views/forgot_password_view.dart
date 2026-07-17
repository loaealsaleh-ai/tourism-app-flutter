import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourismapp/Features/auth/presentation/view_models/auth_state.dart';
import 'package:tourismapp/Features/auth/presentation/view_models/auth_view_model.dart';
import 'package:tourismapp/Features/auth/presentation/widgets/auth_header_icon.dart';
import 'package:tourismapp/Features/auth/presentation/widgets/custom_auth_text_field.dart';
import 'package:tourismapp/Features/auth/presentation/widgets/primary_auth_button.dart';
import 'package:tourismapp/app/router/app_router.dart';
import 'package:tourismapp/core/constants/app_constants.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: BlocConsumer<AuthViewModel, AuthState>(
        listener: (context, state) {
          if (state is ForgotPasswordSuccess) {

            context.go(
              '${AppRouter.verifyCode}'
              '?email=${Uri.encodeComponent(state.email)}'
              '&isPasswordReset=true',
            );
          }
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error.replaceAll('Exception: ', '')),
                backgroundColor: Colors.redAccent,
              ),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is AuthLoading;

          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () => context.go(AppRouter.login),
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    padding: EdgeInsets.zero,
                    color: kPrimaryColor,
                  ),
                  const SizedBox(height: 32),

                  Center(
                    child: AuthHeaderIcon(variant: AuthIconVariant.shieldLock),
                  ),
                  const SizedBox(height: 28),

                  Center(
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                        fontFamily: 'Playfair Display',
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  Center(
                    child: Text(
                      'Enter your registered email address\nto receive a reset code.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 36),

                  CustomAuthTextField(
                    controller: emailController,
                    hintText: 'Email',
                    prefixIcon: Icons.mail_outline_rounded,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 28),

                  PrimaryAuthButton(
                    label: 'Send',
                    isLoading: isLoading,
                    onTap: () {
                      final email = emailController.text.trim();
                      if (email.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Please enter your email')),
                        );
                        return;
                      }
                      context
                          .read<AuthViewModel>()
                          .forgotPassword(email: email);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
