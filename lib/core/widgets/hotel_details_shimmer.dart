import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HotelDetailsShimmer extends StatelessWidget {
  const HotelDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            color: Colors.grey.shade300,
          ),

          const SizedBox(height: 20),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            height: 30,
            width: 200,
            color: Colors.grey.shade300,
          ),

          const SizedBox(height: 10),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            height: 15,
            width: double.infinity,
            color: Colors.grey.shade300,
          ),

          const SizedBox(height: 10),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            height: 15,
            width: 250,
            color: Colors.grey.shade300,
          ),
        ],
      ),
    );
  }
}
