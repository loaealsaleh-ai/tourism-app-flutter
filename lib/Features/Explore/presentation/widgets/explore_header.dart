import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';

class ExploreHeader extends StatelessWidget {
  const ExploreHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              Text(
                "Explore",
                style: TextStyle(
                  fontSize: width * 0.08,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),

              Text(
                " Syria",
                style: TextStyle(
                  fontSize: width * 0.08,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xffC8B08C),
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.location_on,
                color: const Color(0xffC8B08C),
                size: width * 0.08,
              ),
            ],
          ),
          const SizedBox(height: 3),

          Text(
            "Discover the most beautiful places",
            style: TextStyle(
              fontSize: width * 0.040,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}