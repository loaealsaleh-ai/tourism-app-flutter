import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourismapp/Features/HomeScreen/widgets/bottomNavBarWidget.dart';

import 'Features/HomeScreen/homeScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> screens = [
    const HomeScreen(),
    const Center(child: Text("Explore")),
    const Center(child: Text("favorite")),
    const Center(child: Text("reservation")),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavBarWidget(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
