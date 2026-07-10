import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../data/models/category_filter_model.dart';

class CategoryFilter extends StatefulWidget {
  const CategoryFilter({super.key});

  @override
  State<CategoryFilter> createState() => _CategoryFilterState();
}

class _CategoryFilterState extends State<CategoryFilter> {
  int selectedIndex = 0;

  final categories = [
    ExploreCategory(title: "All", icon: Icons.grid_view_rounded),
    ExploreCategory(title: "Historical", icon: Icons.account_balance),
    ExploreCategory(title: "Nature", icon: Icons.eco_outlined),
    ExploreCategory(title: "Religious", icon: Icons.mosque_outlined),
    ExploreCategory(title: "Coastal", icon: Icons.waves_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: SizedBox(
        height: 45,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,

          itemCount: categories.length,

          separatorBuilder: (_, __) => const SizedBox(width: 10),
          itemBuilder: (context, index) {
            final isSelected = selectedIndex == index;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),

                decoration: BoxDecoration(
                  color: isSelected ? kPrimaryColor : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),

                child: Row(
                  children: [
                    Icon(
                      categories[index].icon,
                      size: 20,
                      color: isSelected ? Colors.white : kPrimaryColor,
                    ),

                    const SizedBox(width: 8),

                    Text(
                      categories[index].title,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: isSelected ? Colors.white : kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
