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

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({
    super.key,
    required this.email,
    required this.otp,
  });

  final String email;
  final String otp;

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirm = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: BlocConsumer<AuthViewModel, AuthState>(
        listener: (context, state) {
          if (state is ResetPasswordSuccess) {
            const subtitle =
                'Your password has been changed.\nPlease log in again with a new password.';
            context.go(
              '${AppRouter.authSuccess}'
              '?subtitle=${Uri.encodeComponent(subtitle)}',
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
                    child: AuthHeaderIcon(variant: AuthIconVariant.shieldStars),
                  ),
                  const SizedBox(height: 24),

                  Center(
                    child: Text(
                      'Create New Password',
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
                      'Please enter a new password to change',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 36),

                  CustomAuthTextField(
                    controller: _passwordController,
                    hintText: 'New Password',
                    prefixIcon: Icons.lock_outline_rounded,
                    obscureText: _obscurePassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.black38,
                        size: 20,
                      ),
                      onPressed: () =>
                          setState(() => _obscurePassword = !_obscurePassword),
                    ),
                  ),
                  const SizedBox(height: 16),

                  CustomAuthTextField(
                    controller: _confirmController,
                    hintText: 'Confirm Password',
                    prefixIcon: Icons.lock_outline_rounded,
                    obscureText: _obscureConfirm,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirm
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.black38,
                        size: 20,
                      ),
                      onPressed: () =>
                          setState(() => _obscureConfirm = !_obscureConfirm),
                    ),
                  ),
                  const SizedBox(height: 32),

                  PrimaryAuthButton(
                    label: 'Reset',
                    isLoading: isLoading,
                    onTap: () {
                      final pass = _passwordController.text;
                      final confirm = _confirmController.text;

                      if (pass.isEmpty || confirm.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Please fill all fields')),
                        );
                        return;
                      }
                      if (pass != confirm) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Passwords do not match')),
                        );
                        return;
                      }

                      context.read<AuthViewModel>().resetPassword(
                            email: widget.email,
                            otp: widget.otp,
                            password: pass,
                          );
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
