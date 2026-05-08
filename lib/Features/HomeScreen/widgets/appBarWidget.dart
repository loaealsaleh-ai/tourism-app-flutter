import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const Icon(
          Icons.menu,
          color: Colors.white,
          size: 26,
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Colors.black45,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.notifications,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
