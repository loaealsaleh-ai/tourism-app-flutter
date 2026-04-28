import 'package:flutter/cupertino.dart';

import '../../../const.dart';

class AppBartStartedScreen extends StatelessWidget {
  const AppBartStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(logoImage, height: 40),
        SizedBox(width: 5),
        Text(
          'Shamora',
          style: TextStyle(
            color: KPrimarColor,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontFamily: 'Playfair Display',
          ),
        ),
      ],
    );
  }
}
