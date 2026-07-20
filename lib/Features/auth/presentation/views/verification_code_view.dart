import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:tourismapp/Features/auth/presentation/view_models/auth_state.dart';
import 'package:tourismapp/Features/auth/presentation/view_models/auth_view_model.dart';
import 'package:tourismapp/Features/auth/presentation/widgets/primary_auth_button.dart';
import 'package:tourismapp/app/router/app_router.dart';
import 'package:tourismapp/core/constants/app_constants.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({
    super.key,
    required this.email,
    required this.isPasswordReset,
  });

  final String email;

  final bool isPasswordReset;

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  final _pinController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _pinController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onVerifyPressed(BuildContext context) {
    final code = _pinController.text;

    if (code.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter the full 6-digit code')),
      );
      return;
    }

    if (widget.isPasswordReset) {
      context.go(
        '${AppRouter.resetPassword}'
        '?email=${Uri.encodeComponent(widget.email)}'
        '&otp=${Uri.encodeComponent(code)}',
      );
    } else {
      context.read<AuthViewModel>().verifyOtp(
            email: widget.email,
            otp: code,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 52,
      height: 58,
      textStyle: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: kPrimaryColor,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.transparent),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: kPrimaryColor, width: 1.5),
      ),
    );

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: BlocConsumer<AuthViewModel, AuthState>(
        listener: (context, state) {

          if (state is VerifyOtpSuccess) {
            const subtitle =
                'Your account has been created .\nEnjoy Using the App';
            context.go(
              '${AppRouter.authSuccess}'
              '?subtitle=${Uri.encodeComponent(subtitle)}',
            );
          }

          if (state is AuthSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.blueAccent,
              ),
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
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () => context.go(AppRouter.login),
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    padding: EdgeInsets.zero,
                    color: kPrimaryColor,
                  ),
                  const SizedBox(height: 28),

                  Center(
                    child: Column(
                      children: [
                        Text(
                          'CO',
                          style: TextStyle(
                            fontSize: 72,
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor,
                            fontFamily: 'Playfair Display',
                            height: 1.0,
                          ),
                        ),
                        Text(
                          'DE',
                          style: TextStyle(
                            fontSize: 72,
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor,
                            fontFamily: 'Playfair Display',
                            height: 1.0,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Verification',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  Center(
                    child: Text(
                      'Please enter 6 digit verification that\nhave been sent to your email address',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 36),

                  Center(
                    child: Pinput(
                      length: 6,
                      controller: _pinController,
                      focusNode: _focusNode,
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      onCompleted: (_) => _onVerifyPressed(context),
                    ),
                  ),
                  const SizedBox(height: 36),

                  PrimaryAuthButton(
                    label: 'Verify',
                    isLoading: isLoading,
                    onTap: () => _onVerifyPressed(context),
                  ),
                  const SizedBox(height: 20),

                  if (!widget.isPasswordReset)
                    Center(
                      child: Column(
                        children: [
                          Text(
                            "Don't receive code?",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 4),
                          GestureDetector(
                            onTap: isLoading
                                ? null
                                : () {
                                    context.read<AuthViewModel>().resendOtp(
                                          email: widget.email,
                                        );
                                  },
                            child: Text(
                              'Resend Code',
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationColor: kPrimaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
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
