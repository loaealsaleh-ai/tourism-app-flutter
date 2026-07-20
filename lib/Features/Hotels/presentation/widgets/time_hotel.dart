import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';

class TimeHotel extends StatelessWidget {
  const TimeHotel({super.key, required this.checkIn, required this.checkOut});
  final String checkIn;
  final String checkOut;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _InfoItem(
            icon: Icons.apartment_outlined,
            title: "Check-in",
            value: checkIn,
          ),
        ),

        const SizedBox(
          height: 40,
          child: VerticalDivider(
            thickness: 1,
          ),
        ),

        Expanded(
          child: _InfoItem(
            icon: Icons.apartment_outlined,
            title: "Check-out",
            value: checkOut,
          ),
        ),

      ],
    );
  }
}

class _InfoItem extends StatelessWidget {
  const _InfoItem({
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: kPrimaryColor,
          size: 24,
        ),

        const SizedBox(width: 8),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),

            Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}