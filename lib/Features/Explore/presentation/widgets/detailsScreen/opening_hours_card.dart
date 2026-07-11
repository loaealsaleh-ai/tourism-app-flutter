import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_constants.dart';

class OpeningHoursCard extends StatelessWidget {
  const OpeningHoursCard({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height*0.20,
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [

              CircleAvatar(
                radius: 10,
                backgroundColor: kPrimaryColor.withOpacity(.1),
                child: Icon(
                  Icons.access_time_outlined,
                  color: kPrimaryColor,
                  size: 18,
                ),
              ),

              const SizedBox(width: 10),

              const Text(
                "Opening Hours",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          const Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Text("Open"),
              Text("08:00 AM"),
            ],
          ),

          SizedBox(height: 10),

          const Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Text("Close"),
              Text("06:00 PM"),
            ],
          ),
        ],
      ),
    );
  }
}