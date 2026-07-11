import 'package:flutter/material.dart';
import 'package:tourismapp/core/constants/app_constants.dart';

import '../../../../core/constants/app_text_styles.dart';

class FoodType {
  final String label;
  final IconData icon;

  const FoodType({required this.label, required this.icon});
}

class FoodTypesSection extends StatelessWidget {
  final List<FoodType> foodTypes;

  const FoodTypesSection({
    super.key,
    this.foodTypes = const [
      FoodType(label: "Italian cuisine", icon: Icons.local_pizza_outlined),
      FoodType(label: "American cuisine", icon: Icons.lunch_dining_outlined),
    ],
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Food Types", style: AppTextStyles.title),
        const SizedBox(height: 12),
        Row(
          children: foodTypes
              .map(
                (type) => Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Container(
                width: 80,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: kPrimaryColor.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(type.icon, color: kPrimaryColor, size: 20),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      type.label,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
              .toList(),
        ),
      ],
    );
  }
}