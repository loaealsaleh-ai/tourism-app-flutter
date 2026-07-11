import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_text_styles.dart';

class RestaurantDetailsDescription extends StatelessWidget {
  final String description;

  const RestaurantDetailsDescription({
    super.key,
    this.description =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About the Restaurant',
          style: AppTextStyles.title,
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 15,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}