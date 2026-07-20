import 'package:flutter/material.dart';
import 'package:tourismapp/core/constants/app_constants.dart';

import '../../../../core/constants/app_text_styles.dart';

class RoomInfoSection extends StatelessWidget {
  const RoomInfoSection({super.key, required this.price, required this.type});
  final String price;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            Text(
              "Room",
              style: AppTextStyles.title,
            ),

            Row(
              children: [
                Text(
                  "\$ ${price}",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "/night",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 10),

         Row(
          children: [
            Icon(
              Icons.people,
              color: Colors.grey,
              size: 20,
            ),
            SizedBox(width: 8),
            Text(
              type,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}