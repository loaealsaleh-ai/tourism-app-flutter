import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourismapp/Features/GetStartedScreen/widgets/appBarGetStartedScreen.dart';
import 'package:tourismapp/const.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppBartStartedScreen(),
          Text(
            'What would you like ',
            style: TextStyle(
              color: KPrimarColor,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: 'Playfair Display'
            ),
          ),
          Text(
            'to explore?',
            style: TextStyle(
              color: KPrimarColor,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: 'Playfair Display'
            ),
          ),
          Text('Sign in to discover more about the',style: TextStyle(color: Colors.grey,fontSize: 17),),
          Text('most beautiful places in Syria',style: TextStyle(color: Colors.grey,fontSize: 17)),
        ],
      ),
    );
  }
}
