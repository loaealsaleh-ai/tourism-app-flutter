import 'package:flutter/material.dart';
import 'package:tourismapp/core/constants/app_constants.dart';

import '../../../../core/constants/app_text_styles.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          "Location",
          style: AppTextStyles.title
        ),

        const SizedBox(height: 12),

        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            locationImage,
            height: size.height * 0.18,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}