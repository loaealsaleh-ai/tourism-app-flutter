import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourismapp/features/GetStartedScreen/widgets/appBarGetStartedScreen.dart';
import 'package:tourismapp/features/GetStartedScreen/widgets/listViewCards.dart';
import 'package:tourismapp/const.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(GetStartedImage, fit: BoxFit.cover),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 60),
                AppBartStartedScreen(),
                SizedBox(height: 10),
                Text(
                  'What would you like\n to explore?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: KPrimarColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Playfair Display',
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Sign in to discover more about the\n most beautiful places in Syria',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 17),
                ),
                ListViewCards(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
