import 'package:flutter/material.dart';
import 'package:tourismapp/core/constants/app_constants.dart';

import '../../../../core/constants/app_text_styles.dart';

class WorkingHoursSection extends StatelessWidget {
  final String hours;

  const WorkingHoursSection({super.key, this.hours = "10 AM - 12 PM"});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Working hours", style: AppTextStyles.title),
        const SizedBox(height: 10),
        Row(
          children: [
            const Icon(
              Icons.access_time_outlined,
              color: kPrimaryColor,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              hours,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ],
    );
  }
}