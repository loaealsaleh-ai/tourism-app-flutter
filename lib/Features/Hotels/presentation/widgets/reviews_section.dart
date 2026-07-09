import 'package:flutter/material.dart';
import 'package:tourismapp/core/constants/app_constants.dart';

import '../../../../core/constants/app_text_styles.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final reviews = [
      {"name": "Name", "opinion": "Opinion", "rating": 4},
      {"name": "Name", "opinion": "Opinion", "rating": 3},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(
              "Reviews",
              style: AppTextStyles.title
            ),
            TextButton(
              onPressed: () {},
              child:  Text(
                "See all",
                style: AppTextStyles.subtitle
              ),
            ),
          ],
        ),

        SizedBox(
          height: MediaQuery.of(context).size.height*0.12,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: reviews.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final review = reviews[index];

              return Container(
                width: MediaQuery.of(context).size.width * 0.68,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.person,
                      color: kPrimaryColor,
                      size: 28,
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                review["name"] as String,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),

                              const Spacer(),

                              Row(
                                children: List.generate(
                                  5,
                                      (starIndex) => Icon(
                                    starIndex < (review["rating"] as int)
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: Colors.amber,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),
                          Text(
                            review["opinion"] as String,
                            style: AppTextStyles.subtitle
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}