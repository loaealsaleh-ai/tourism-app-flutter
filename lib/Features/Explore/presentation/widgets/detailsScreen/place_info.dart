import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:readmore/readmore.dart';
import 'package:tourismapp/Features/Explore/presentation/widgets/detailsScreen/ticket_price_card.dart';
import 'package:tourismapp/core/constants/app_constants.dart';
import 'package:tourismapp/core/constants/app_text_styles.dart';

import '../../../../../app/router/app_router.dart';
import '../../../../Hotels/presentation/widgets/location_section.dart';
import 'commet_card.dart';
import 'opening_hours_card.dart';

class PlaceInfo extends StatefulWidget {
  const PlaceInfo({super.key});

  @override
  State<PlaceInfo> createState() => _PlaceInfoState();
}

class _PlaceInfoState extends State<PlaceInfo> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(width * .05),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20,
            offset: Offset(0, -3),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      "Aleppo Citadel",
                      style: TextStyle(
                        fontSize: width * 0.07,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Row(
                      children: [
                        Icon(Icons.location_on, size: 18, color: Colors.grey),
                        SizedBox(width: 4),
                        Text("Aleppo, Syria"),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),

                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(16),
                ),

                child: const Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber),
                    SizedBox(width: 6),
                    Text("4.8"),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          Divider(),
          const SizedBox(height: 20),

          Text("Description", style: AppTextStyles.title),

          const SizedBox(height: 20),

          ReadMoreText(
            "hbsjfhfdfhksdhg dsfk dhjfkshgdjfdsfsdgfgfd fgsdgfdgfdk dhfgdkjagf dkhgsfhds dhfgjhgdhfjhdfahjvkdfhkjdasgh dfhgbhgdfkjshgdfjkadsgfhjgdasdjfueygfefbhdjdfajkdshgfjdfdadfds",
            trimLines: 2,
            trimMode: TrimMode.Line,
            trimCollapsedText: ' Read More',
            trimExpandedText: ' Show Less',
            moreStyle: const TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
            lessStyle: const TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Divider(),
          Row(
            children: [
              Expanded(child: OpeningHoursCard()),

              SizedBox(width: 12),

              Expanded(child: TicketPriceCard()),
            ],
          ),
          Divider(),
          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Comments", style: AppTextStyles.title),
              InkWell(
                onTap: () {
                  context.push(AppRouter.routCommentsScreen);
                },
                child: Text("View All", style: AppTextStyles.subtitle),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.20,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CommentCard();
              },
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemCount: 2,
            ),
          ),
          const SizedBox(height: 10),

          Divider(),
          const SizedBox(height: 10),

          LocationSection(),
        ],
      ),
    );
  }
}
