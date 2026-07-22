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

        // Fixed-height area (2 lines worth) so whatever comes after
        // this section always starts at the same vertical position,
        // regardless of how short or long the description text is.
        SizedBox(
          height: 45,
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 15,
                height: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}