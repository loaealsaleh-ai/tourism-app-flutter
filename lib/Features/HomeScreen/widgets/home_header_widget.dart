import 'package:flutter/material.dart';
import 'package:tourismapp/Features/HomeScreen/widgets/app_bar_widget.dart';
import 'package:tourismapp/core/widgets/search_widget.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          Container(
            height: 285,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(24, 95, 24, 30),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff0D5C5C),
                  Color(0xff3FA7A7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Damascus, Syria",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 8),

                Row(
                  children: [
                    const Icon(
                      Icons.wb_sunny_rounded,
                      color: Colors.amber,
                      size: 70,
                    ),

                    const SizedBox(width: 18),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "28°C",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 46,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Sunny Day",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    WeatherInfoItem(
                      icon: Icons.water_drop_outlined,
                      text: "Humidity 45%",
                    ),
                    WeatherInfoItem(
                      icon: Icons.air,
                      text: "Wind 12 km/h",
                    ),
                  ],
                ),
              ],
            ),
          ),

          const Positioned(
            top: 45,
            left: 24,
            right: 24,
            child: AppBarWidget(),
          ),

          const Positioned(
            left: 10,
            right: 10,
            bottom: 0,
            child: SearchWidget(),
          ),
        ],
      ),
    );
  }
}

class WeatherInfoItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const WeatherInfoItem({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white, size: 18),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
