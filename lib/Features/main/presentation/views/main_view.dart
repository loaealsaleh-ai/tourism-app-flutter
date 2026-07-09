import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourismapp/Features/HomeScreen/presentation/views/home_view.dart';
import 'package:tourismapp/Features/main/presentation/view_models/main_view_model.dart';
import 'package:tourismapp/Features/main/presentation/widgets/bottom_nav_bar.dart';
import 'package:tourismapp/core/constants/app_constants.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  static final List<Widget> _screens = [
    const HomeView(),
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
            backgroundColor: kBackgroundColor,
            body: _screens[currentIndex],
            bottomNavigationBar: BottomNavBar(
              currentIndex: currentIndex,
              onTap: context.read<MainViewModel>().changeTab,
            ),
          );
        },
      ),
    );
  }
}
