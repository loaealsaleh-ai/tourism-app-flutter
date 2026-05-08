import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourismapp/const.dart';

class buildDot extends StatelessWidget {
  const buildDot({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 20 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? KPrimarColor : Colors.black26,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
