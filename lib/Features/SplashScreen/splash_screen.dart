import 'package:flutter/material.dart';
import 'widgets/SpalshScreen_Body.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpalshScreenBody(),
    );
  }
}
