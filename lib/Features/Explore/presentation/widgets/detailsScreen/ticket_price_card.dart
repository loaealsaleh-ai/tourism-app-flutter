import 'package:flutter/material.dart';

import '../../../../../core/constants/app_constants.dart';


class TicketPriceCard extends StatelessWidget {
  const TicketPriceCard({super.key});

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
                  Icons.confirmation_number_outlined,
                  color: kPrimaryColor,
                  size: 18,
                ),
              ),

              const SizedBox(width: 10),

              const Text(
                "Ticket Price",
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
              Text("Ticket"),
              Text(
                "5\$",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          SizedBox(height: 10),

          const Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Text("Child (6-12)"),
              Text(
                "2\$",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          SizedBox(height: 10),

          const Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Text("Under 6 year"),
              Text(
                "Free",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}