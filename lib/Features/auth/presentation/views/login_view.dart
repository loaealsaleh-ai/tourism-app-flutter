import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourismapp/Features/auth/presentation/view_models/auth_state.dart';
import 'package:tourismapp/Features/auth/presentation/view_models/auth_view_model.dart';
import 'package:tourismapp/Features/auth/presentation/widgets/custom_auth_text_field.dart';
import 'package:tourismapp/Features/auth/presentation/widgets/primary_auth_button.dart';
import 'package:tourismapp/app/router/app_router.dart';
import 'package:tourismapp/core/constants/app_constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: BlocConsumer<AuthViewModel, AuthState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            context.go(AppRouter.routMainScreen);
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

          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(getStartedImage),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                      
                      Text(
                        'Welcome back!',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                          fontFamily: 'Playfair Display',
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Sign in to discover more about\nthe most beautiful in Syria',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 28),

                      CustomAuthTextField(
                        controller: emailController,
                        hintText: 'Email',
                        prefixIcon: Icons.mail_outline_rounded,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 14),

                      CustomAuthTextField(
                        controller: passwordController,
                        hintText: 'Password',
                        prefixIcon: Icons.lock_outline_rounded,
                        obscureText: _obscurePassword,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Colors.black38,
                            size: 20,
                          ),
                          onPressed: () =>
                              setState(() => _obscurePassword = !_obscurePassword),
                        ),
                      ),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () => context.go(AppRouter.forgotPassword),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            'Forget Password?',
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),

                      PrimaryAuthButton(
                        label: 'Log in',
                        isLoading: isLoading,
                        onTap: () {
                          context.read<AuthViewModel>().login(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              );
                        },
                      ),
                      const SizedBox(height: 20),

                      Row(
                        children: [
                          const Expanded(child: Divider(thickness: 1)),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              'OR',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Expanded(child: Divider(thickness: 1)),
                        ],
                      ),
                      const SizedBox(height: 20),

                      _GoogleButton(),
                      const SizedBox(height: 24),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have account?  ",
                            style: TextStyle(color: Colors.black54, fontSize: 14),
                          ),
                          GestureDetector(
                            onTap: () => context.go(AppRouter.register),
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _GoogleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Google Sign-In coming soon')),
        );
      },
      child: Container(
        width: double.infinity,
        height: 54,
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                      text: 'G', style: TextStyle(color: Color(0xFF4285F4))),
                  TextSpan(
                      text: 'o', style: TextStyle(color: Color(0xFFEA4335))),
                  TextSpan(
                      text: 'o', style: TextStyle(color: Color(0xFFFBBC05))),
                  TextSpan(
                      text: 'g', style: TextStyle(color: Color(0xFF4285F4))),
                  TextSpan(
                      text: 'l', style: TextStyle(color: Color(0xFF34A853))),
                  TextSpan(
                      text: 'e', style: TextStyle(color: Color(0xFFEA4335))),
                ],
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'Continue with Google',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
