import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourismapp/Features/HomeScreen/widgets/bottomNavBarWidget.dart';
import 'package:tourismapp/Features/main/presentation/view_models/main_view_model.dart';

import 'Features/HomeScreen/homeScreen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static final List<Widget> _screens = [
    const HomeScreen(),
    const Center(child: Text("Explore")),
    const Center(child: Text("My Booking")),
    const Center(child: Text("Favorite")),
    const Center(child: Text("Services")),
    const Center(child: Text("Profile")),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainViewModel(),
      child: BlocBuilder<MainViewModel, int>(
        builder: (context, currentIndex) {
          return Scaffold(
            body: _screens[currentIndex],
            bottomNavigationBar: BottomNavBarWidget(
              currentIndex: currentIndex,
              onTap: context.read<MainViewModel>().changeTab,
            ),
          );
        },
      ),
    );
  }
}
