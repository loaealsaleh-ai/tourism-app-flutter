import 'package:flutter/material.dart';

import '../../../const.dart';

class BottomNavBarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBarWidget({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.08),
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: KPrimarColor,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 15,
        unselectedFontSize: 12,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 28),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined, size: 28),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined, size: 28),
            label: "My Booking",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border, size: 28),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.miscellaneous_services_outlined, size: 28),
            label: "Services",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, size: 28),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}