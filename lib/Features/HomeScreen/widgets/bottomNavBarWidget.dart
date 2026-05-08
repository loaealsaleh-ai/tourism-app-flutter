import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourismapp/const.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.black12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          navItem(Icons.home, 0),
          navItem(Icons.explore, 1),
          navItem(Icons.favorite_border, 2),
          navItem(Icons.home_repair_service_outlined, 3),

        ],
      ),
    );
  }

  Widget navItem(IconData icon, int index) {
    bool isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? KPrimarColor : Colors.black54,
            size: isSelected?30:27,
          ),
          const SizedBox(height: 6),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 3,
            width: isSelected ? 20 : 0,
            decoration: BoxDecoration(
              color: KPrimarColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}