import 'package:flutter/material.dart';
import 'package:tourismapp/core/constants/app_constants.dart';

class RoomDetailsSection extends StatelessWidget {
  final String bedrooms;
  final String bathrooms;
  final String balcony;
  final String floor;

  const RoomDetailsSection({
    super.key,
    required this.bedrooms,
    required this.bathrooms,
    required this.balcony,
    required this.floor
  });

  @override
  Widget build(BuildContext context) {
    final details = [
      {"icon": Icons.bed_outlined, "title": "Bedrooms", "value": bedrooms},
      {"icon": Icons.bathtub_outlined, "title": "Bathrooms", "value": bathrooms},
      {"icon": Icons.balcony_outlined, "title": "Balcony", "value": balcony},
      {"icon": Icons.apartment, "title": "floor", "value": floor},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Room Details",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500,color: kPrimaryColor),
        ),
        const SizedBox(height: 14),

        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: details.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.1,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            final item = details[index];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  item["title"] as String,
                  style: const TextStyle(color: Colors.grey, fontSize: 15),
                ),
                const SizedBox(height: 6),
                Icon(
                  item["icon"] as IconData,
                  color: kPrimaryColor,
                  size: 22,
                ),
                const SizedBox(height: 4),
                Text(
                  item["value"] as String,
                  style: const TextStyle(fontSize: 15,color: kPrimaryColor),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}